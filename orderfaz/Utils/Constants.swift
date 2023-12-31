//
//  Constants.swift
//  orderfaz
//
//  Created by User on 12/07/23.
//

import Foundation

struct Constants {
    static let HTTP = "https://"
    static let DOMAIN = ".orderfaz.com/";
    
    static let DUMMYSTORE = "Starry 2"
    
    static let TOKENDEV = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6ImhhcnJ5a3Vybmlhd2FuYmV0YUBnbWFpbC5jb20iLCJkZXZpY2VJZCI6IiIsImlkIjoiNzM1MjkzY2MtYTU4Zi00Y2IzLTkzYTItNDY4OTk1NDQyNmM3IiwiaXNFbWFpbFZlcmlmaWVkIjp0cnVlLCJpc01zaXNkblZlcmlmaWVkIjp0cnVlLCJpc0tZQ1ZlcmlmaWVkIjp0cnVlLCJpc1N1c3BlbmRlZCI6ZmFsc2UsIm1zaXNkbiI6IjYyODIxODY3NzAzMzAiLCJuYW1lIjoiaGFycnkiLCJwYXJlbnRJZCI6IjczNTI5M2NjLWE1OGYtNGNiMy05M2EyLTQ2ODk5NTQ0MjZjNyIsInVzZXJSb2xlIjoiU3VwZXIgVXNlciIsInVzZXJBY2Nlc3MiOlsxMDAsMjAwLDIwMSwyMDIsMjAzLDMwMCwzMDEsMzAyLDMwMyw0MDAsNDAxLDQwMiw0MDMsNDA0LDUwMCw1MDEsNTAyLDUwMyw2MDAsNjAxLDYwMiw2MDMsNjA0LDYwNSw3MDAsNzAxLDgwMCw4MDEsODAyLDgwMyw5MDAsOTAxLDkwMiw5MDMsMTAwMCwxMDAxLDExMDAsMTEwMSwxMjAwLDEyMDEsMTIwMiwxMzAwLDEzMDEsMTMwMiwxMzAzLDE0MDAsMTQwMSwxNDAyLDE0MDNdLCJ1c2VyVHlwZSI6MTAwLCJ1c2VyU3Vic2NyaXB0aW9uSWQiOiI4NGRhZmEwZi0zYzM2LTRmNmItOTZhNC1kMDIyZmI5OTIzYTkiLCJ1c2VyU3Vic2NyaXB0aW9uTmFtZSI6IkZyZWUiLCJ1c2VyU3Vic2NyaXB0aW9uTGV2ZWwiOjAsInVzZXJTdWJzY3JpcHRpb25Jc0FjdGl2ZSI6dHJ1ZSwidXNlclN1YnNjcmlwdGlvblByb2R1Y3RMaW1pdCI6NSwidXNlclN1YnNjcmlwdGlvbkNvTGltaXQiOjUsInVzZXJTdWJzY3JpcHRpb25Qcm9kdWN0TGltaXRJbkNvIjoxLCJ1c2VyU3Vic2NyaXB0aW9uTWVtYmVyTGltaXQiOjAsInVzZXJTdWJzY3JpcHRpb25NYXJrZXRwbGFjZUxpbWl0IjoxLCJ1c2VyU3Vic2NyaXB0aW9uSXNTdG9yZWZyb250Ijp0cnVlLCJ1c2VyU3Vic2NyaXB0aW9uSXNDdXN0b21Eb21haW4iOmZhbHNlLCJ1c2VyU3Vic2NyaXB0aW9uSXNDc1JvdGF0b3IiOmZhbHNlLCJ1c2VyU3Vic2NyaXB0aW9uSXNOb3RpZldhIjpmYWxzZSwidXNlclN1YnNjcmlwdGlvbklzU2NoZWR1bGVJbnZvaWNlIjpmYWxzZSwidXNlclN1YnNjcmlwdGlvbkV4cGlyZWRBdCI6bnVsbCwib2FJZCI6bnVsbCwiZXhwIjoxNzIxOTc5NzI1LCJqdGkiOiJjY2U3YmEzYy01NzcyLTQ3OWUtODk5OC00NzA5YTRjYTRjOWQiLCJpYXQiOjE2OTA0NDM3MjUsImlzcyI6Ik9yZGVyZmF6Iiwic3ViIjoiNzM1MjkzY2MtYTU4Zi00Y2IzLTkzYTItNDY4OTk1NDQyNmM3In0.qRLGz_1EI6B0HkIrjq2QHp99iMYY5MNOuy7R_0FRUxI"
    
    static let TOKENPROD = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6IiIsImRldmljZUlkIjoiIiwiaWQiOiI3ZjE2NzJmZS0xN2VkLTQ5Y2YtYjkwMi1jYjBmYTg1NDgzNDEiLCJpc0VtYWlsVmVyaWZpZWQiOmZhbHNlLCJpc01zaXNkblZlcmlmaWVkIjp0cnVlLCJpc0tZQ1ZlcmlmaWVkIjp0cnVlLCJpc1N1c3BlbmRlZCI6ZmFsc2UsIm1zaXNkbiI6IjYyODIxODY3NzAzMzEiLCJuYW1lIjoiSGFycnl5IiwicGFyZW50SWQiOiI3ZjE2NzJmZS0xN2VkLTQ5Y2YtYjkwMi1jYjBmYTg1NDgzNDEiLCJ1c2VyUm9sZSI6IlN1cGVyIFVzZXIiLCJ1c2VyQWNjZXNzIjpbMTAwLDIwMCwyMDEsMjAyLDIwMywzMDAsMzAxLDMwMiwzMDMsNDAwLDQwMSw0MDIsNDAzLDQwNCw1MDAsNTAxLDUwMiw1MDMsNjAwLDYwMSw2MDIsNjAzLDYwNCw2MDUsNzAwLDcwMSw4MDAsODAxLDgwMiw4MDMsOTAwLDkwMSw5MDIsOTAzLDEwMDAsMTAwMSwxMTAwLDExMDEsMTIwMCwxMjAxLDEyMDIsMTMwMCwxMzAxLDEzMDIsMTMwMywxNDAwLDE0MDEsMTQwMiwxNDAzXSwidXNlclR5cGUiOjEwMCwidXNlclN1YnNjcmlwdGlvbklkIjoiODRkYWZhMGYtM2MzNi00ZjZiLTk2YTQtZDAyMmZiOTkyM2E5IiwidXNlclN1YnNjcmlwdGlvbk5hbWUiOiJGcmVlIiwidXNlclN1YnNjcmlwdGlvbkxldmVsIjowLCJ1c2VyU3Vic2NyaXB0aW9uSXNBY3RpdmUiOnRydWUsInVzZXJTdWJzY3JpcHRpb25Qcm9kdWN0TGltaXQiOjUsInVzZXJTdWJzY3JpcHRpb25Db0xpbWl0Ijo1LCJ1c2VyU3Vic2NyaXB0aW9uUHJvZHVjdExpbWl0SW5DbyI6MSwidXNlclN1YnNjcmlwdGlvbk1lbWJlckxpbWl0IjowLCJ1c2VyU3Vic2NyaXB0aW9uTWFya2V0cGxhY2VMaW1pdCI6MSwidXNlclN1YnNjcmlwdGlvbklzU3RvcmVmcm9udCI6dHJ1ZSwidXNlclN1YnNjcmlwdGlvbklzQ3VzdG9tRG9tYWluIjpmYWxzZSwidXNlclN1YnNjcmlwdGlvbklzQ3NSb3RhdG9yIjpmYWxzZSwidXNlclN1YnNjcmlwdGlvbklzTm90aWZXYSI6ZmFsc2UsInVzZXJTdWJzY3JpcHRpb25Jc1NjaGVkdWxlSW52b2ljZSI6ZmFsc2UsInVzZXJTdWJzY3JpcHRpb25FeHBpcmVkQXQiOm51bGwsIm9hSWQiOm51bGwsImV4cCI6MTY5Mjc3MTk1OCwianRpIjoiMThlZmFhODgtYWExMS00YTg5LWE2ODMtMTk5OGI4ZDkzZTZmIiwiaWF0IjoxNjkwMTc5OTU4LCJpc3MiOiJPcmRlcmZheiIsInN1YiI6IjdmMTY3MmZlLTE3ZWQtNDljZi1iOTAyLWNiMGZhODU0ODM0MSJ9.dwu8qAb8h2s3tDid5U6AaYQO7fNyljmLR1rrdcWRYWM"
    
}
