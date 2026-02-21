import OpenAI from 'openai'

const openaiApiKey = import.meta.env.VITE_OPENAI_API_KEY

let openai: OpenAI | null = null

if (openaiApiKey) {
  openai = new OpenAI({
    apiKey: openaiApiKey,
    dangerouslyAllowBrowser: true
  })
} else {
  console.warn('VITE_OPENAI_API_KEY is not set. AI document processing will be disabled.')
}

export async function processDocument(file: File): Promise<{
  category: string
  summary: string
  extractedData: {
    dates?: string[]
    amounts?: string[]
    reference_ids?: string[]
    keywords?: string[]
    due_dates?: string[]
    expiry_dates?: string[]
    payment_dates?: string[]
    renewal_dates?: string[]
  }
  content: string
  urgency_score: number
  confidence_score: number
}> {
  try {
    // Check if OpenAI is available
    if (!openai) {
      console.warn('OpenAI not configured, using fallback processing')
      return createFallbackResult(file.name, file)
    }

    let messageContent: any[] = [
      {
        type: "text",
        text: `You are an ULTRA-ELITE German/European document analysis AI with 99.99% accuracy. You are SPECIALIZED in PERFECT categorization and COMPREHENSIVE data extraction for German AND English bureaucratic documents.

**CRITICAL LANGUAGE HANDLING**:
- Documents can be in GERMAN, ENGLISH, or MIXED languages
- You MUST recognize keywords in BOTH languages
- Apply the SAME categorization rules regardless of language
- Be EXTRA sharp in detecting multilingual patterns

**ULTRA-PRECISE CATEGORIZATION RULES** (Follow these EXACTLY - NO EXCEPTIONS):

1. **Real Estate & Housing** (Use "Real Estate"):
   GERMAN: Mietvertrag, Untermietvertrag, Wohnungsbesichtigung, Kündigung Wohnung, Immobilienkauf, Hypotheken, Grundsteuerbescheid, Hausverwaltung, Betriebskosten, Nebenkosten, Kaution, Miete, Wohnungsübergabe, Wohnung, Immobilie, Untermiete, Vermieter, Mieter, Wohnraum, Eigentumswohnung, Haus, Grundstück
   ENGLISH: Sublet Agreement, Subletting Contract, Apartment viewing, Housing inspection, Apartment termination, Rental termination, Property purchase, Real estate transaction, Mortgage, Home loan, Property tax notice, Property management, Utility costs, Operating costs, Security deposit, Rental deposit, Rent, Rental payment, Apartment handover, Lease agreement, Tenancy agreement, Property deed, Real estate, Housing, Landlord, Tenant, Residential
   KEYWORDS: rent, apartment, housing, property, sublet, subletting, lease, tenancy, landlord, tenant, mortgage, real estate

2. **Banking & Finance** (Use "Banking"):
   GERMAN: Kontoauszug, Kreditkarte, Überweisung, Lastschrift, Kredit, Darlehen, Finanzierung, Zinsen, Investment, Aktien, Fonds, Sparkasse, Deutsche Bank, Commerzbank, ING, DKB, Girokonto, Sparbuch, Depot, Wertpapiere, Bankgebühren, Dispozinsen, Kreditlinie, Finanzberatung
   ENGLISH: Bank statement, Account statement, Credit card statement, Transfer, Wire transfer, Direct debit, Loan, Credit, Financing, Interest, Investment, Stocks, Funds, Banking, Account, Transaction, Payment, Financial statement, Credit report, Mortgage statement, Investment portfolio
   KEYWORDS: bank, account, credit, loan, transfer, payment, financial, investment, statement, transaction

3. **Tax & Government** (Use "Tax"):
   GERMAN: Steuerbescheid, Steuererklärung, Finanzamt, Lohnsteuerbescheinigung, Umsatzsteuer, Behörden, Ämter, Bürgeramt, Meldeamt, Einkommensteuer, Gewerbesteuer, Kirchensteuer, Solidaritätszuschlag, Steuerklasse, Freibetrag, Steuernummer, Steuer-ID
   ENGLISH: Tax assessment, Tax notice, Tax return, Tax declaration, Tax office, Payroll tax certificate, VAT, Sales tax, Government offices, Registration office, Income tax, Tax authority, Tax refund, Tax liability, Tax exemption
   KEYWORDS: tax, steuer, finanzamt, government, authority, assessment, return, declaration, VAT, income

4. **Healthcare & Medical** (Use "Healthcare"):
   GERMAN: Arztbrief, Rezept, Krankenversicherung, Behandlung, Diagnose, Medikamente, Krankenkasse, Gesundheit, AOK, TK, Barmer, DAK, Krankenhaus, Klinik, Therapie, Untersuchung, Befund, Impfung, Vorsorge, Rehabilitation, Physiotherapie
   ENGLISH: Doctor's letter, Medical report, Prescription, Health insurance, Treatment, Medical treatment, Diagnosis, Medication, Medicine, Health insurance company, Health, Medical, Hospital, Clinic, Therapy, Examination, Medical findings, Vaccination, Preventive care
   KEYWORDS: medical, health, doctor, prescription, treatment, diagnosis, medication, insurance, hospital, clinic

5. **Legal & Contracts** (Use "Legal"):
   GERMAN: Verträge (EXCEPT Mietvertrag), Rechtsanwalt, Gericht, Rechtsdokumente, Vollmacht, Testament, Erbschaft, Klage, Anwaltskanzlei, Notar, Gerichtsverfahren, Rechtsbeistand, Mandant, Kläger, Beklagte, Urteil, Beschluss, Berufung, Revision
   ENGLISH: Contracts (EXCEPT rental), Lawyer, Attorney, Court, Legal proceedings, Legal documents, Power of attorney, Will, Inheritance, Lawsuit, Legal action, Law firm, Notary, Legal proceedings, Legal counsel, Client, Plaintiff, Defendant, Judgment, Appeal
   KEYWORDS: legal, contract, lawyer, attorney, court, lawsuit, inheritance, will, power of attorney

6. **Employment & Work** (Use "Employment"):
   GERMAN: Arbeitsvertrag, Gehaltsabrechnung, Kündigung (work-related), Zeugnis, Bewerbung, Personalakte, Urlaub, Krankschreibung, Arbeitgeber, Arbeitnehmer, Lohnabrechnung, Arbeitszeit, Überstunden, Betriebsrat, Tarifvertrag, Probezeit, Elternzeit, Rente
   ENGLISH: Employment contract, Work contract, Payroll, Salary statement, Employment termination, Certificate, Work reference, Job application, Personnel file, Vacation, Holiday, Sick leave, Employer, Employee, Salary slip, Working hours, Overtime, Probation, Pension
   KEYWORDS: employment, work, job, salary, payroll, contract, termination, vacation, sick leave

7. **Insurance** (Use "Insurance"):
   GERMAN: Versicherungspolice, Schadensmeldung, Haftpflicht, Hausrat, Auto, Leben, Versicherungsgesellschaft, Allianz, AXA, Generali, ERGO, Krankenversicherung, Unfallversicherung, Rechtsschutz, Berufsunfähigkeit, Risikolebensversicherung, Kfz-Versicherung, Gebäudeversicherung
   ENGLISH: Insurance policy, Damage report, Insurance claim, Liability insurance, Household insurance, Car insurance, Vehicle insurance, Life insurance, Insurance company, Health insurance, Accident insurance, Legal protection, Disability insurance, Term life insurance, Auto insurance, Building insurance
   KEYWORDS: insurance, policy, claim, liability, coverage, premium, deductible, benefit

8. **Education** (Use "Education"):
   GERMAN: Zeugnis, Diplom, Universität, Schule, Studium, Ausbildung, Weiterbildung, Bildungseinrichtungen, Hochschule, Fachhochschule, Gymnasium, Realschule, Hauptschule, Grundschule, Berufsschule, Studiengang, Semester, Prüfung, Abschluss, Bachelor, Master, Promotion
   ENGLISH: Certificate, Diploma, Grades, Degree, University diploma, University, College, School, Educational institution, Studies, Academic program, Training, Apprenticeship, Continuing education, Higher education, Academic transcript, Examination, Graduation, Bachelor's degree, Master's degree, PhD
   KEYWORDS: education, school, university, college, degree, diploma, certificate, academic, study, training

9. **Utilities & Services** (Use "Utilities"):
   GERMAN: Strom, Gas, Wasser, Internet, Telefon, Stadtwerke, Energieversorger, Rechnungen für Versorgungsleistungen, Vattenfall, E.ON, RWE, Telekom, Vodafone, Heizung, Müllabfuhr, Abwasser, Kabelfernsehen, Mobilfunk, DSL, Glasfaser
   ENGLISH: Electricity, Power bill, Gas bill, Heating, Water bill, Water utility, Internet, Phone, Telecommunications, Municipal utilities, Energy provider, Utility bills, Cable TV, Mobile phone, Broadband, Fiber optic, Waste management, Sewage
   KEYWORDS: utility, electricity, gas, water, internet, phone, telecommunications, energy, power, heating

10. **Travel & Transportation** (Use "Travel"):
    GERMAN: Flugticket, Bahnticket, Hotel, Reise, Visum, Reiseversicherung, Mietwagen, Urlaub, Geschäftsreise, Flughafen, Bahnhof, Buchung, Reservierung, Stornierung, Gepäck, Verspätung, Erstattung, Reisebüro, Ferienwohnung, Pension
    ENGLISH: Flight ticket, Airline ticket, Train ticket, Railway, Hotel, Accommodation, Booking, Travel, Trip, Visa, Travel document, Travel insurance, Car rental, Vacation, Holiday trip, Business trip, Airport, Train station, Reservation, Cancellation, Luggage, Delay, Refund, Travel agency
    KEYWORDS: travel, flight, train, hotel, booking, vacation, trip, visa, rental, transportation

11. **Other** (ONLY for truly unclassifiable documents):
    - Use this EXTREMELY rarely, only when absolutely nothing else fits

**ULTRA-ENHANCED INTELLIGENT DATE EXTRACTION** (Extract EVERY possible date in BOTH languages):

GERMAN PATTERNS: Fälligkeitsdatum, fällig am, fällig bis, Ablaufdatum, läuft ab am, gültig bis, Zahlungsziel, Zahlung bis, zu zahlen bis, Einreichung bis, Einreichungsfrist, Antwort bis, Rückmeldung bis, spätestens, vor dem, nach dem, bis zum, bis spätestens, Verlängerung bis, Verlängerungsfrist, Kündigung zum, Kündigungsfrist, Wirksamkeit ab, wirksam ab, Gültigkeit, gültig von, gültig bis, Laufzeit, Vertragslaufzeit, Termin, Terminvereinbarung, Stichtag, Abgabetermin, Anmeldeschluss, Bewerbungsfrist, Zahlungseingang, Mahnung, Vollstreckung

ENGLISH PATTERNS: due date, due by, payable by, payment due, deadline, expiry date, expiration date, valid until, valid from, must be submitted by, last date to send, final submission date, you have to send by, payment deadline, submission deadline, application deadline, renewal date, cancellation date, effective date, termination date, maturity date, settlement date

DATE FORMATS TO RECOGNIZE:
- German: 15.03.2024, 15. März 2024, 15.3.24, 15/03/2024
- English: March 15, 2024, 03/15/2024, 15/03/2024, 2024-03-15
- Mixed: 15 Mar 2024, 15.Mar.2024, Mar 15, 2024

**ULTRA-ENHANCED AMOUNT EXTRACTION** (Find ALL monetary values in BOTH languages):

GERMAN TERMS: Miete, Kaution, Gebühren, Kosten, Preise, Steuern, Bußgelder, Rechnungsbeträge, Zinsen, Betrag, Summe, Gesamtbetrag, Teilbetrag, Anzahlung, Restzahlung, Nachzahlung, Erstattung, Rückzahlung, Mahngebühr, Bearbeitungsgebühr, Verwaltungskosten, Nebenkosten, Grundgebühr, Pauschale

ENGLISH TERMS: Rent, Security deposit, Fees, Charges, Costs, Expenses, Prices, Taxes, Fines, Penalties, Invoice amounts, Interest, Amount, Sum, Total amount, Partial amount, Down payment, Final payment, Additional payment, Refund, Repayment, Late fee, Processing fee, Administrative costs, Additional costs, Base fee, Flat rate

CURRENCY PATTERNS: €123,45 | 123.45 EUR | EUR 123,45 | $123.45 | USD 123.45 | CHF 123.45 | £123.45 | GBP 123.45 | 123,45€ | 123.45€ | €123.456,78 | 1.234,56 EUR

**ULTRA-ENHANCED REFERENCE ID EXTRACTION** (Find ALL identifiers in BOTH languages):

GERMAN TERMS: Kundennummer, Vertragsnummer, Aktenzeichen, Rechnungsnummer, Bestellnummer, Referenz, Steuer-ID, Versicherungsnummer, Kontonummer, Objektnummer, Policennummer, Mandantennummer, Geschäftszeichen, Vorgangsnummer, Belegnummer, Auftragsnummer, Personalnummer, Mitgliedsnummer, Registernummer, Lizenznummer

ENGLISH TERMS: Customer number, Contract number, File reference, Invoice number, Order number, Reference number, Tax ID, Insurance number, Account number, Property number, Policy number, Client number, Case number, Transaction number, Document number, Job number, Employee number, Member number, Registration number, License number

ID PATTERNS: Look for alphanumeric codes like: ABC-123456, REF123456, #123456, ID: 123456, Nr. 123456, No. 123456, KD-123456, VTR-123456

**ULTRA-PRECISE URGENCY SCORING** (1-10 scale with multilingual context):
- 10: SOFORT/IMMEDIATE/URGENT - due today or overdue
- 9: SEHR DRINGEND/VERY URGENT - due within 1-2 days
- 8: DRINGEND/URGENT - due within 3-7 days
- 7: WICHTIG/IMPORTANT - due within 2 weeks
- 6: BEACHTEN/ATTENTION - due within 1 month
- 5: NORMAL/NORMAL - due within 2-3 months
- 4: NIEDRIG/LOW - due within 6 months
- 3: GERING/MINIMAL - due within 1 year
- 2: MINIMAL/MINIMAL - no specific deadline
- 1: ARCHIV/ARCHIVE - historical document

**ULTRA-PRECISE CONFIDENCE SCORING** (0.0-1.0):
- 0.95-1.0: PERFECT match with clear document patterns (German OR English)
- 0.85-0.94: VERY HIGH confidence with strong indicators
- 0.75-0.84: HIGH confidence with good indicators
- 0.65-0.74: GOOD confidence with some indicators
- 0.50-0.64: MODERATE confidence, unclear category
- Below 0.50: LOW confidence, needs manual review

**SPECIAL MULTILINGUAL DOCUMENT RECOGNITION PATTERNS**:
- "Untermietvertrag" OR "Sublet" OR "Subletting" → Real Estate (NEVER Other!)
- "Mietvertrag" OR "Lease Agreement" OR "Tenancy Agreement" → Real Estate
- "Steuerbescheid" OR "Tax Assessment" OR "Tax Notice" → Tax
- "Arbeitsvertrag" OR "Employment Contract" → Employment
- "Versicherungspolice" OR "Insurance Policy" → Insurance
- "Kontoauszug" OR "Bank Statement" → Banking
- "Arztbrief" OR "Medical Report" OR "Doctor's Letter" → Healthcare
- "Stromrechnung" OR "Electricity Bill" OR "Power Bill" → Utilities
- "Bahnticket" OR "Train Ticket" OR "Railway Ticket" → Travel

**ADVANCED KEYWORD DETECTION**:
- Scan for COMPOUND WORDS in German (e.g., "Untermietvertrag" = "Unter" + "miet" + "vertrag")
- Detect PARTIAL MATCHES (e.g., "miet" in "Untermietvertrag", "Mietvertrag", "Vermieter")
- Recognize ABBREVIATIONS (e.g., "KV" for Krankenversicherung, "AG" for Arbeitgeber)
- Identify CONTEXT CLUES (e.g., company names, official letterheads, document formats)

**CONTENT ANALYSIS INSTRUCTIONS**:
Provide a detailed summary that includes:
- Document type and purpose
- Key parties involved (anonymized)
- Important deadlines or dates
- Financial obligations or amounts
- Required actions or next steps

**CRITICAL ANALYSIS STEPS**:
1. READ the ENTIRE document content carefully
2. IDENTIFY the primary language (German/English/Mixed)
3. SCAN for ALL keywords in BOTH languages
4. EXTRACT dates using ALL possible patterns
5. FIND amounts with ALL currency formats
6. LOCATE reference IDs with ALL patterns
7. DETERMINE category with 99.99% accuracy
8. ASSIGN proper urgency and confidence scores

Return ONLY valid JSON in this EXACT format (no additional text):
{
  "category": "exact_category_name",
  "summary": "detailed_document_description_with_context",
  "extractedData": {
    "dates": ["2024-03-15", "2024-12-31"],
    "amounts": ["€1,234.56", "€89.00"],
    "reference_ids": ["REF-123456", "KD-789012"],
    "keywords": ["keyword1", "keyword2", "keyword3"],
    "due_dates": ["2024-04-15"],
    "expiry_dates": ["2024-12-31"],
    "payment_dates": ["2024-03-01"],
    "renewal_dates": ["2024-06-30"]
  },
  "content": "comprehensive_summary_of_document_purpose_and_requirements",
  "urgency_score": 7,
  "confidence_score": 0.95
}`
      }
    ]

    // Handle different file types
    if (file.type.startsWith('image/')) {
      const base64 = await fileToBase64(file)
      messageContent.push({
        type: "image_url",
        image_url: {
          url: base64
        }
      })
    } else {
      const textContent = await fileToText(file)
      messageContent[0].text += `\n\nDocument content to analyze:\n${textContent.substring(0, 12000)}`
    }
    
    const response = await openai.chat.completions.create({
      model: "gpt-4o",
      messages: [
        {
          role: "user",
          content: messageContent
        }
      ],
      max_tokens: 3000,
      temperature: 0.01 // Ultra-low temperature for maximum consistency
    })

    let content = response.choices[0].message.content || '{}'
    
    // Advanced JSON cleaning and extraction
    content = content.trim()
    content = content.replace(/^```json\s*/i, '').replace(/\s*```$/i, '')
    content = content.replace(/^```\s*/i, '').replace(/\s*```$/i, '')
    content = content.replace(/^`\s*/i, '').replace(/\s*`$/i, '')
    
    let result
    try {
      result = JSON.parse(content)
    } catch (parseError) {
      console.error('Failed to parse OpenAI response as JSON:', parseError)
      console.error('Raw content:', content)
      
      // Advanced JSON extraction attempts
      const jsonMatch = content.match(/\{[\s\S]*\}/);
      if (jsonMatch) {
        try {
          result = JSON.parse(jsonMatch[0])
        } catch (secondParseError) {
          console.error('Second JSON parse attempt failed:', secondParseError)
          
          // Try to extract key information manually if JSON parsing fails
          result = extractDataManually(content, file.name, file)
        }
      } else {
        result = createFallbackResult(file.name, file)
      }
    }
    
    // Validate and enhance the result
    return {
      category: validateCategory(result.category) || 'Other',
      summary: result.summary || file.name.replace(/\.[^/.]+$/, ""),
      extractedData: {
        dates: Array.isArray(result.extractedData?.dates) ? result.extractedData.dates : [],
        amounts: Array.isArray(result.extractedData?.amounts) ? result.extractedData.amounts : [],
        reference_ids: Array.isArray(result.extractedData?.reference_ids) ? result.extractedData.reference_ids : [],
        keywords: Array.isArray(result.extractedData?.keywords) ? result.extractedData.keywords : [],
        due_dates: Array.isArray(result.extractedData?.due_dates) ? result.extractedData.due_dates : [],
        expiry_dates: Array.isArray(result.extractedData?.expiry_dates) ? result.extractedData.expiry_dates : [],
        payment_dates: Array.isArray(result.extractedData?.payment_dates) ? result.extractedData.payment_dates : [],
        renewal_dates: Array.isArray(result.extractedData?.renewal_dates) ? result.extractedData.renewal_dates : []
      },
      content: result.content || 'Document processed successfully',
      urgency_score: typeof result.urgency_score === 'number' ? Math.max(1, Math.min(10, result.urgency_score)) : 1,
      confidence_score: typeof result.confidence_score === 'number' ? Math.max(0, Math.min(1, result.confidence_score)) : 0.5
    }
  } catch (error) {
    console.error('Error processing document:', error)
    return createFallbackResult(file.name, file)
  }
}

function validateCategory(category: string): string {
  const validCategories = [
    'Real Estate', 'Banking', 'Tax', 'Healthcare', 'Legal', 
    'Employment', 'Insurance', 'Education', 'Utilities', 'Travel', 'Other'
  ]
  
  if (validCategories.includes(category)) {
    return category
  }
  
  // Smart category mapping for common variations
  const categoryMappings: { [key: string]: string } = {
    'Housing': 'Real Estate',
    'Property': 'Real Estate',
    'Rent': 'Real Estate',
    'Rental': 'Real Estate',
    'Finance': 'Banking',
    'Bank': 'Banking',
    'Government': 'Tax',
    'Medical': 'Healthcare',
    'Health': 'Healthcare',
    'Work': 'Employment',
    'Job': 'Employment',
    'School': 'Education',
    'University': 'Education',
    'Utility': 'Utilities',
    'Transportation': 'Travel'
  }
  
  return categoryMappings[category] || 'Other'
}

function extractDataManually(content: string, filename: string, file: File) {
  // Manual extraction as fallback
  const lowerContent = content.toLowerCase()
  const lowerFilename = filename.toLowerCase()
  
  let category = 'Other'
  
  // Smart category detection based on keywords
  if (lowerContent.includes('sublet') || lowerContent.includes('untermiete') || lowerContent.includes('mietvertrag') || lowerContent.includes('rent') || 
      lowerFilename.includes('sublet') || lowerFilename.includes('untermiete') || lowerFilename.includes('mietvertrag') || lowerFilename.includes('rent')) {
    category = 'Real Estate'
  } else if (lowerContent.includes('bank') || lowerContent.includes('konto') || lowerContent.includes('überweisung') ||
             lowerFilename.includes('bank') || lowerFilename.includes('konto')) {
    category = 'Banking'
  } else if (lowerContent.includes('steuer') || lowerContent.includes('finanzamt') || lowerContent.includes('tax') ||
             lowerFilename.includes('steuer') || lowerFilename.includes('tax')) {
    category = 'Tax'
  } else if (lowerContent.includes('arzt') || lowerContent.includes('kranken') || lowerContent.includes('medical') ||
             lowerFilename.includes('arzt') || lowerFilename.includes('kranken') || lowerFilename.includes('medical')) {
    category = 'Healthcare'
  } else if (lowerContent.includes('versicherung') || lowerContent.includes('insurance') ||
             lowerFilename.includes('versicherung') || lowerFilename.includes('insurance')) {
    category = 'Insurance'
  } else if (lowerContent.includes('arbeit') || lowerContent.includes('employment') || lowerContent.includes('gehalt') ||
             lowerFilename.includes('arbeit') || lowerFilename.includes('employment')) {
    category = 'Employment'
  }
  
  return {
    category,
    summary: `${category} Document: ${filename.replace(/\.[^/.]+$/, "")}`,
    extractedData: {
      dates: [],
      amounts: [],
      reference_ids: [],
      keywords: [],
      due_dates: [],
      expiry_dates: [],
      payment_dates: [],
      renewal_dates: []
    },
    content: 'Document processed with manual extraction',
    urgency_score: 3,
    confidence_score: 0.4
  }
}

function createFallbackResult(filename: string, file?: File) {
  // Enhanced fallback with filename analysis
  const lowerFilename = filename.toLowerCase()
  let category = 'Other'
  
  // Analyze filename for category hints
  if (lowerFilename.includes('sublet') || lowerFilename.includes('untermiete') || lowerFilename.includes('mietvertrag') || lowerFilename.includes('rent')) {
    category = 'Real Estate'
  } else if (lowerFilename.includes('bank') || lowerFilename.includes('konto')) {
    category = 'Banking'
  } else if (lowerFilename.includes('steuer') || lowerFilename.includes('tax')) {
    category = 'Tax'
  } else if (lowerFilename.includes('arzt') || lowerFilename.includes('kranken') || lowerFilename.includes('medical')) {
    category = 'Healthcare'
  } else if (lowerFilename.includes('versicherung') || lowerFilename.includes('insurance')) {
    category = 'Insurance'
  } else if (lowerFilename.includes('arbeit') || lowerFilename.includes('employment')) {
    category = 'Employment'
  }
  
  return {
    category,
    summary: `${category} Document: ${filename.replace(/\.[^/.]+$/, "")}`,
    extractedData: {
      dates: [],
      amounts: [],
      reference_ids: [],
      keywords: [],
      due_dates: [],
      expiry_dates: [],
      payment_dates: [],
      renewal_dates: []
    },
    content: openai ? 'Unable to process document content' : 'Document processed without AI (API key not configured)',
    urgency_score: 3,
    confidence_score: openai ? 0.3 : 0.8
  }
}

function fileToBase64(file: File): Promise<string> {
  return new Promise((resolve, reject) => {
    const reader = new FileReader()
    reader.readAsDataURL(file)
    reader.onload = () => resolve(reader.result as string)
    reader.onerror = error => reject(error)
  })
}

function fileToText(file: File): Promise<string> {
  return new Promise((resolve, reject) => {
    const reader = new FileReader()
    reader.readAsText(file)
    reader.onload = () => resolve(reader.result as string)
    reader.onerror = error => reject(error)
  })
}