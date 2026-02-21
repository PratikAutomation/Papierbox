import React from 'react'
import { motion } from 'framer-motion'
import { FileText, Calendar, DollarSign, Hash, ExternalLink, Download, Trash2 } from 'lucide-react'
import { format } from 'date-fns'
import { Document, supabase } from '../lib/supabase'

interface DocumentListProps {
  documents: Document[]
  onDocumentDeleted: () => void
}

export function DocumentList({ documents, onDocumentDeleted }: DocumentListProps) {
  const getCategoryColor = (category: string) => {
    const colors = {
      Bank: 'bg-blue-100 text-blue-800',
      University: 'bg-purple-100 text-purple-800',
      Office: 'bg-gray-100 text-gray-800',
      Insurance: 'bg-green-100 text-green-800',
      Legal: 'bg-red-100 text-red-800',
      Medical: 'bg-pink-100 text-pink-800',
      Tax: 'bg-yellow-100 text-yellow-800',
      Utility: 'bg-orange-100 text-orange-800',
      Other: 'bg-gray-100 text-gray-800'
    }
    return colors[category as keyof typeof colors] || colors.Other
  }

  const handleDownload = async (document: Document) => {
    try {
      if (!document.file_path || typeof document.file_path !== 'string') {
        console.error('Invalid file path for document:', document.id)
        alert('Unable to download file: Invalid file path')
        return
      }

      const { data, error } = await supabase.storage
        .from('documents')
        .download(document.file_path)

      if (error) throw error

      const url = URL.createObjectURL(data)
      const a = document.createElement('a')
      a.href = url
      a.download = document.filename
      document.body.appendChild(a)
      a.click()
      document.body.removeChild(a)
      URL.revokeObjectURL(url)
    } catch (error) {
      console.error('Error downloading file:', error)
      alert('Error downloading file. Please try again.')
    }
  }

  const generateShareLink = async (document: Document) => {
    try {
      if (!document.file_path || typeof document.file_path !== 'string') {
        console.error('Invalid file path for document:', document.id)
        alert('Unable to generate share link: Invalid file path')
        return
      }

      // Create a meaningful share message
      const shareMessage = `Document: ${document.title || document.filename}\nCategory: ${document.category}\nShared via Papierbox`
      
      const { data } = await supabase.storage
        .from('documents')
        .createSignedUrl(document.file_path, 3600) // 1 hour

      if (data) {
        // Create a user-friendly share text with hyperlink format
        const documentName = document.title || document.filename
        const shareText = `${shareMessage}\n\n📎 Click to download: ${documentName}\nShared via Papierbox\n${data.signedUrl}`
        
        // Try to use Web Share API if available, otherwise copy to clipboard
        if (navigator.share) {
          try {
            await navigator.share({
              title: `📄 ${documentName}`,
              text: shareMessage,
              url: data.signedUrl
            })
          } catch (shareError) {
            // If share fails for any reason other than user cancellation, fall back to clipboard
            if (shareError.name !== 'AbortError') {
              navigator.clipboard.writeText(shareText)
              alert('📋 Document link copied to clipboard!')
            }
          }
        } else {
          navigator.clipboard.writeText(shareText)
          alert('📋 Document link copied to clipboard!')
        }
      }
    } catch (error) {
      console.error('Error generating share link:', error)
      alert('Error generating share link. Please try again.')
    }
  }

  const handleDelete = async (document: Document) => {
    if (!confirm(`Are you sure you want to permanently delete "${document.filename}"? This action cannot be undone.`)) {
      return
    }

    try {
      // Delete from storage first
      if (document.file_path && typeof document.file_path === 'string') {
        const { error: storageError } = await supabase.storage
          .from('documents')
          .remove([document.file_path])

        if (storageError) {
          console.error('Error deleting file from storage:', storageError)
          // Continue with database deletion even if storage deletion fails
        }
      }

      // Delete from database
      const { error: dbError } = await supabase
        .from('documents')
        .delete()
        .eq('id', document.id)

      if (dbError) throw dbError

      // Refresh the document list
      onDocumentDeleted()
      
    } catch (error) {
      console.error('Error deleting document:', error)
      alert('Error deleting document. Please try again.')
    }
  }

  if (documents.length === 0) {
    return (
      <div className="p-12 text-center text-gray-500">
        <FileText className="w-16 h-16 mx-auto mb-4 text-gray-300" />
        <h3 className="text-lg font-medium mb-2">No documents found</h3>
        <p>Upload your first document to get started</p>
      </div>
    )
  }

  return (
    <div className="p-4 sm:p-6">
      <div className="space-y-4">
        {documents.map((document, index) => (
          <motion.div
            key={document.id}
            initial={{ opacity: 0, y: 20 }}
            animate={{ opacity: 1, y: 0 }}
            transition={{ delay: index * 0.1 }}
            className="border border-gray-200 rounded-2xl p-4 sm:p-6 hover:shadow-md transition-shadow"
          >
            <div className="flex flex-col sm:flex-row items-start justify-between gap-4">
              <div className="flex-1">
                <div className="flex flex-col sm:flex-row sm:items-center space-y-2 sm:space-y-0 sm:space-x-3 mb-3">
                  <div className="w-10 h-10 bg-[#29AB87]/10 rounded-xl flex items-center justify-center">
                    <FileText className="w-5 h-5 text-[#29AB87]" />
                  </div>
                  <div className="flex-1 min-w-0">
                    <h3 className="font-medium text-gray-900 text-sm sm:text-base truncate">{document.title}</h3>
                    <p className="text-xs sm:text-sm text-gray-500">
                      {format(new Date(document.created_at), 'MMM d, yyyy')} • 
                      {(document.file_size / 1024).toFixed(1)} KB
                    </p>
                  </div>
                  <span className={`self-start sm:self-center px-3 py-2 rounded-xl text-xs font-bold whitespace-nowrap shadow-sm ${getCategoryColor(document.category)}`}>
                    {document.category}
                  </span>
                </div>

                {document.content_preview && (
                  <div className="bg-gray-50 p-4 rounded-xl mb-4">
                    <p className="text-gray-700 text-sm leading-relaxed line-clamp-3">
                      {document.content_preview}
                    </p>
                  </div>
                )}

                <div className="flex flex-wrap gap-2 sm:gap-4 text-xs sm:text-sm">
                  {document.extracted_data.dates && document.extracted_data.dates.length > 0 && (
                    <div className="flex items-center space-x-2 bg-blue-50 px-3 py-2 rounded-lg text-blue-700">
                      <Calendar className="w-4 h-4" />
                      <span>{document.extracted_data.dates.length} date{document.extracted_data.dates.length !== 1 ? 's' : ''}</span>
                    </div>
                  )}
                  
                  {document.extracted_data.amounts && document.extracted_data.amounts.length > 0 && (
                    <div className="flex items-center space-x-2 bg-green-50 px-3 py-2 rounded-lg text-green-700">
                      <DollarSign className="w-4 h-4" />
                      <span>{document.extracted_data.amounts.length} amount{document.extracted_data.amounts.length !== 1 ? 's' : ''}</span>
                    </div>
                  )}
                  
                  {document.extracted_data.reference_ids && document.extracted_data.reference_ids.length > 0 && (
                    <div className="flex items-center space-x-2 bg-purple-50 px-3 py-2 rounded-lg text-purple-700">
                      <Hash className="w-4 h-4" />
                      <span>{document.extracted_data.reference_ids.length} reference{document.extracted_data.reference_ids.length !== 1 ? 's' : ''}</span>
                    </div>
                  )}
                </div>

                {document.extracted_data.keywords && document.extracted_data.keywords.length > 0 && (
                  <div className="mt-3">
                    <div className="flex flex-wrap gap-2">
                      {document.extracted_data.keywords.slice(0, 5).map((keyword, i) => (
                        <span
                          key={i}
                          className="px-3 py-1 bg-gradient-to-r from-gray-100 to-gray-200 text-gray-700 text-xs rounded-full whitespace-nowrap font-medium"
                        >
                          {keyword}
                        </span>
                      ))}
                      {document.extracted_data.keywords.length > 5 && (
                        <span className="px-3 py-1 bg-gradient-to-r from-[#29AB87]/10 to-[#238f73]/10 text-[#29AB87] text-xs rounded-full font-medium">
                          +{document.extracted_data.keywords.length - 5} more
                        </span>
                      )}
                    </div>
                  </div>
                )}
              </div>

              <div className="flex items-center space-x-2 sm:ml-4 self-start sm:self-center">
                <button
                  onClick={() => handleDownload(document)}
                  className="p-2 text-gray-600 hover:text-blue-600 hover:bg-blue-50 rounded-xl transition-all duration-200"
                  title="Download"
                >
                  <Download className="w-5 h-5" />
                </button>
                <button
                  onClick={() => generateShareLink(document)}
                  className="p-2 text-gray-600 hover:text-green-600 hover:bg-green-50 rounded-xl transition-all duration-200"
                  title="Share"
                >
                  <ExternalLink className="w-5 h-5" />
                </button>
                <button
                  onClick={() => handleDelete(document)}
                  className="p-2 text-red-600 hover:text-red-700 hover:bg-red-50 rounded-xl transition-all duration-200"
                  title="Delete"
                >
                  <Trash2 className="w-5 h-5" />
                </button>
              </div>
            </div>
          </motion.div>
        ))}
      </div>
    </div>
  )
}