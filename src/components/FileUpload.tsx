import React, { useState, useCallback } from 'react'
import { motion } from 'framer-motion'
import { useDropzone } from 'react-dropzone'
import { X, Upload, FileText, CheckCircle } from 'lucide-react'
import { supabase } from '../lib/supabase'
import { processDocument } from '../lib/openai'
import { useAuth } from '../hooks/useAuth'

interface FileUploadProps {
  onClose: () => void
  onUploadComplete: () => void
}

export function FileUpload({ onClose, onUploadComplete }: FileUploadProps) {
  const [uploading, setUploading] = useState(false)
  const [progress, setProgress] = useState(0)
  const [status, setStatus] = useState('')
  const [completed, setCompleted] = useState(false)
  const { user } = useAuth()

  const onDrop = useCallback(async (acceptedFiles: File[]) => {
    if (!user || acceptedFiles.length === 0) return

    setUploading(true)
    setProgress(0)
    setStatus('Uploading file...')

    try {
      const file = acceptedFiles[0]
      const fileExt = file.name.split('.').pop()
      const fileName = `${user.id}/${Date.now()}.${fileExt}`

      // Upload to Supabase Storage
      setStatus('Uploading to secure storage...')
      setProgress(25)
      
      const { data: uploadData, error: uploadError } = await supabase.storage
        .from('documents')
        .upload(fileName, file)

      if (uploadError) throw uploadError

      setStatus('Processing document with AI...')
      setProgress(50)

      // Process with OpenAI
      const aiResult = await processDocument(file)

      setStatus('Saving document metadata...')
      setProgress(75)

      // Create display title with original filename and AI summary
      const displayTitle = aiResult.summary ? `${aiResult.summary}` : file.name
      
      // Extract primary due date and amount for quick access
      const primaryDueDate = aiResult.extractedData.due_dates?.[0] || 
                           aiResult.extractedData.expiry_dates?.[0] || 
                           aiResult.extractedData.payment_dates?.[0] || 
                           aiResult.extractedData.renewal_dates?.[0] || null
      
      const primaryAmount = aiResult.extractedData.amounts?.[0] ? 
                          parseFloat(aiResult.extractedData.amounts[0].replace(/[€$£¥,]/g, '')) : null
      
      const primaryReferenceId = aiResult.extractedData.reference_ids?.[0] || null

      // Save to database
      const { error: dbError } = await supabase
        .from('documents')
        .insert({
          user_id: user.id,
          title: displayTitle,
          filename: file.name,
          file_path: uploadData.path,
          file_size: file.size,
          mime_type: file.type,
          category: aiResult.category,
          extracted_data: aiResult.extractedData,
          due_date: primaryDueDate,
          amount: primaryAmount,
          reference_id: primaryReferenceId,
        })

      if (dbError) throw dbError

      setStatus('Document processed successfully!')
      setProgress(100)
      setCompleted(true)

      setTimeout(() => {
        onUploadComplete()
        onClose()
      }, 2000)

    } catch (error) {
      console.error('Upload error:', error)
      setStatus('Upload failed. Please try again.')
      setUploading(false)
    }
  }, [user, onUploadComplete, onClose])

  const { getRootProps, getInputProps, isDragActive } = useDropzone({
    onDrop,
    accept: {
      'image/*': ['.png', '.jpg', '.jpeg'],
      'application/pdf': ['.pdf'],
      'text/*': ['.txt'],
    },
    multiple: false,
  })

  return (
    <div className="fixed inset-0 bg-black/50 flex items-center justify-center p-4 z-50">
      <motion.div
        initial={{ opacity: 0, scale: 0.95 }}
        animate={{ opacity: 1, scale: 1 }}
        className="bg-white rounded-3xl p-6 sm:p-8 max-w-md w-full mx-4"
      >
        <div className="flex items-center justify-between mb-6">
          <h2 className="text-lg sm:text-xl font-semibold text-gray-900">Upload Document</h2>
          <button
            onClick={onClose}
            className="p-2 hover:bg-gray-100 rounded-lg transition-colors"
          >
            <X className="w-5 h-5" />
          </button>
        </div>

        {!uploading ? (
          <div
            {...getRootProps()}
            className={`border-2 border-dashed rounded-2xl p-8 sm:p-12 text-center transition-colors cursor-pointer ${
              isDragActive
                ? 'border-[#29AB87] bg-[#29AB87]/5'
                : 'border-gray-300 hover:border-[#29AB87] hover:bg-[#29AB87]/5'
            }`}
          >
            <input {...getInputProps()} />
            <Upload className="w-10 sm:w-12 h-10 sm:h-12 text-gray-400 mx-auto mb-4" />
            <p className="text-base sm:text-lg font-medium text-gray-900 mb-2">
              {isDragActive ? 'Drop your document here' : 'Drag & drop your document'}
            </p>
            <p className="text-sm sm:text-base text-gray-600 mb-4">
              or click to select from your device
            </p>
            <p className="text-xs sm:text-sm text-gray-500">
              Supports PDF, images, and text files
            </p>
          </div>
        ) : (
          <div className="text-center py-8">
            {completed ? (
              <>
                <CheckCircle className="w-12 sm:w-16 h-12 sm:h-16 text-green-500 mx-auto mb-4" />
                <p className="text-base sm:text-lg font-medium text-green-600 mb-2">Upload Complete!</p>
                <p className="text-xs sm:text-sm text-gray-600">Redirecting to dashboard...</p>
              </>
            ) : (
              <>
                <FileText className="w-12 sm:w-16 h-12 sm:h-16 text-[#29AB87] mx-auto mb-4" />
                <p className="text-base sm:text-lg font-medium text-gray-900 mb-4">{status}</p>
                
                <div className="w-full bg-gray-200 rounded-full h-2 mb-4">
                  <div
                    className="bg-[#29AB87] h-2 rounded-full transition-all duration-300"
                    style={{ width: `${progress}%` }}
                  />
                </div>
                
                <p className="text-xs sm:text-sm text-gray-600">{progress}% complete</p>
              </>
            )}
          </div>
        )}

        {!uploading && (
          <div className="mt-6">
            <button
              onClick={onClose}
              className="w-full py-2 sm:py-3 border border-gray-300 text-gray-700 rounded-xl hover:bg-gray-50 transition-colors text-sm sm:text-base"
            >
              Cancel
            </button>
          </div>
        )}
      </motion.div>
    </div>
  )
}