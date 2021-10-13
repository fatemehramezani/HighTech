
using ClassLibrary.com.smsmelli.www;

public class Sms
{
    private  string context;
    private string mobile;

	public Sms(string context,string mobile)
	{
	    this.mobile = mobile;
	    this.context = context;
	}
    public string Send(string userName, string password, string phone)
    {
        string result = string.Empty;
        smsserver server = new smsserver();
        result = server.GetCredit(userName, password) + " ";
        result += server.SendSMS(string.Format("+98{0}",phone), mobile, context, "",userName,password);
        return result;
    }
}