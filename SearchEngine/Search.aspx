<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Search.aspx.cs" Inherits="SearchEngine.Search" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Arama</title>
	<link rel="stylesheet" href="css/style.css" type="text/css" />
    <%
        if (Request.Cookies["article"] != null && Request.Cookies["article"].Value.Length > 0)
        {
            TextBox1.Text = Server.UrlDecode(Request.Cookies["article"].Value);
            if (Request.Cookies["keyword"] != null && Request.Cookies["keyword"].Value.Length > 0)
            {
                TextBox2.Text = Server.UrlDecode(Request.Cookies["keyword"].Value);
            }
        }
        else
        {
            TextBox1.Text = "HATIRLAMAYI KOLAYLAŞTIRAN AKILLI MANEVRALAR\nHafiza bilgileri kaydetme (kodlama), saklama, hatırlama ve tanıma sürecidir. Hatırlarken beş duyumuzu (görme, işitme, dokunma, hissetme, koklama ve tat alma duyularını) tam kapasiteyle kullanırız. Görmek ile gözlemlemek, duymak ile işitmek, anlamak ve yapmak arasında büyük bir fark vardır. Bu fark, hatırlama yeteneğimizin derecesini belirler.\nHatırlamak öğrenmek değildir. Ancak öğrenmek büyük ölçüde hatırlamayı gerektirir. Hatırlama bir süreçtir, öğrenme ise girişilen bir deneyimden elde edilebilecek bir sonuçtur. Hafıza kapasitesi artırılıp geliştirildiğinde öğrenme kapasitesi de büyük ölçüde gelişir.\n1) Netleştirme ve tanım:\nHafızayı geliştirmenin en iyi yollarından biri, geleceğe yönelik planlar, hayaller ve düşünceler gibi içsel görüntülerin detaylı ve net tanımlarını yapmaktır. Böylece detaylı görsel imajlar yaratılır ve tanımlama becerisine yönelik alıştırma yapılır.\n2) İlişkilendirme (bağlantı kurma):\nYeni bilgileri daha sonra hatırlamak için her bilgiyi hafızada bulunan bir olayla ilişkilendirmek (bağlantı kurmak) yararlıdır.\n3) Duyuların hepsini çalıştırma:\nHafızaya erişim sırasında ne kadar fazla sayıda duyusal kanal kullanılırsa, hatırlama da o kadar etkili olur.\n4) Hafiza kancaları:\nHafıza kancaları, bağlantı kurma ve ilişkilendirme dayanır. Önce listenin ezberlenmesini ve sonra da içerisinde bulunan maddeler hakkında aktif zihinsel ilişkilendirme (resim veya film) yaratılmasmı gerektirir.\nBir alışveriş listesi üzerinden örnek verelim: Ekmek, süt, yağ, ayakkabı cilası, çamaşır tozu.\nİlişkilendirme resmi: Ekmek inekten çok fazla süt sağdı ve bundan yağ elde etti. Böylece ayakkabılarını cilaladı ve sonra da fazlalığı yıkayıp atmak için çamaşır makinesine koydu.\n5) Ritim ve kafiye:\nBilgileri işitsel olarak hatırlamak için yararlıdır.\n6) Duruma bağlı öğrenme:\nBilgi kodlanırken bireyin içinde bulunduğu durum, aynı bilgiyi hatırlamak için gereken durumdur.\n7) Görselleştirme veya zihinsel imajlar:\nGörselleştirme hatırlama açısından çok güçlü bir araçtır. Bir resim binlerce sözcükten daha etkilidir. Görüntüler aracılığıyla çok miktarda bilgiyi işlemden geçirmek için görsel kapasitemizi kullandığımızda hafızamızın inanılmaz düzeyde geliştiğini görürsünüz. Bunun bir nedeni de fotoğrafik hafızanın işleyişidir.";
        }
    %>
</head>
<body>
    <div class="body">
		<div class="register">
			<div>
				<div>
					<div class="register">
						<form id="Form2" runat="server">
							<div>
                                <table border="1">
                                    <tr>
                                        <td colspan="2" style="font-size: 20px; text-align: center;">MAKALE İÇERİSİNDE ANAHTAR KELİME ARAMA</td>
                                    </tr>
                                    <tr>
                                        <td rowspan="2">
                                            <asp:TextBox ID="TextBox1" runat="server" Width="400" Height="600" TextMode="MultiLine">
                                            </asp:TextBox></td>
                                        <td align="center" width="500px" height="50px">
                                            <asp:TextBox ID="TextBox2" runat="server" Width="350" OnTextChanged="TextBox2_TextChanged"></asp:TextBox>
                                            <asp:Button ID="Button1" runat="server" Text="Ara" OnClick="Button1_Click" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td width="500px" height="50px">
                                            <%
                                                int find = 0;
                                                string keyword = TextBox2.Text;
                                                if (keyword.Length > 0)
                                                {
                                                    string article = TextBox1.Text;
                                                    int start = 0;
                                                    for (int i = 0; i < article.Length; i++)
                                                    {
                                                        if (start<keyword.Length && article[i]==keyword[start])
                                                        {
                                                            start++;
                                                        }
                                                        else if (article[i]==keyword[0])
                                                        {
                                                            start = 1;
                                                        }
                                                        else
                                                        {
                                                            start = 0;
                                                        }
                                                        if (keyword.Length==start)
                                                        {
                                                            string findresult = "<b><u>" + keyword + "</u></b>";
                                                            int previouswordscount = 0, nextwordscount = 0;
                                                            bool jok=true, iok=true;
                                                            for (int j = i - start, k = i + 1; j > -1 || k < article.Length; j--,k++)
                                                            {
                                                                if (previouswordscount < 8 && j>-1)
                                                                {
                                                                    findresult = article[j] + findresult;
                                                                    if (article[j]==' ')
                                                                    {
                                                                        previouswordscount++;
                                                                    }
                                                                }
                                                                if (nextwordscount < 8 && k < article.Length)
                                                                {
                                                                    findresult = findresult + article[k];
                                                                    if (article[k]==' ')
                                                                    {
                                                                        nextwordscount++;
                                                                    }
                                                                }
                                                            }
                                                            Response.Write("<p>..." + findresult + "...</p><br/>");
                                                            start=0;
                                                            find++;
                                                        }
                                                    }
                                                    Response.Write("<b>" + find + " tane sunuç bulunmuştur.</b><br/>");
                                                }
                                                else
                                                {
                                                    Response.Write("<b>Yukarıdaki kutucuğa anahtar kelime giriniz:</b><br/>");
                                                }
                                            %>
                                        </td>
                                    </tr>
                                </table>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
