require 'google_drive'

class GoogleSheets
    def worksheet
        @session ||= GoogleDrive::Session.from_service_account_key("google_sheets.json")
        @spreadsheets ||= @session.spreadsheet_by_title('XtractIt')
        @worksheet ||= @spreadsheets.worksheets.first
    end

    def add(user_name, followers_count)
        begin
            worksheet.insert_rows(worksheet.num_rows+1, [[user_name, followers_count]])
            worksheet.save
        rescue => e
            puts "An error occured trying to add the data to the sheets"
        end
    end
end
