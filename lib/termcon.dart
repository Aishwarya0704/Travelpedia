import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

class TermAndCon extends StatefulWidget {
  const TermAndCon({Key? key}) : super(key: key);

  @override
  State<TermAndCon> createState() => _TermAndConState();
}

const htmlData = r"""
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Travelpedia</title>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
	<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
	<div class="container">
		<div class="row">
			<div class="col col-lg-12 col-12">
				<h1>Terms & Conditions</h1>
				<h3>Updated at ...</h3>
				<h1>General Terms</h1>
				<p>By accessing and placing an order with us, you confirm that you are in agreement with us and bound by the terms of Service contained in the Terms & Conditions outlined below. 
				These terms apply to the entire app, our social media pages (such as Facebook, Instagram, etc.) and any email or other type of communication between you and us. 
				Under no circumstances shall our team be liable for any direct, indirect, special, incidental or consequential damages, including, but not limited to, loss of data or profit, arising out of the use, or the inability to use, the materials on this app, even if our team or an authorized representative has been advised of the possibility of such damages. 
				If your use of material from this app results in the need for servicing, repair or correction of equipment or data, you assume any costs thereof. 
				We will not be responsible for any outcome that may occur during the course of usage of our resources. 
				We reserve the rights to change prices and revise the resources usage policy at any moment.</p>
				<h1>License</h1>
				<p>Travelpedia grants you a revocable, non-exclusive, non-transferable, limited license to download, install and use our Service strictly in accordance with these Terms and Conditions. These Terms & Conditions are a contract between you and Travelpedia (referred to in these Terms & Conditions as "Travelpedia", "us", "we" or "our"), the provider of our website and the Service accessible from our website (which are collectively referred to in these Terms & Conditions as the "Service"). You are agreeing to be bound by these Terms & Conditions. If you do not agree to these Terms & Conditions, please do not use the Service. In these Terms & Conditions, "you" refers both to you as an individual and to the entity you represent (and for which you hereby acknowledge that you are duly authorised to enter this agreement on their behalf). If you violate any of these Terms & Conditions, we reserve the right to cancel your account or block access to your account without notice.</p>
				<h1>Definitions and key terms for this Terms & Conditions: </h1>				
				<p> Cookie: small amount of data generated by a website and saved by your web browser. 
				It is used to identify your browser, provide analytics and remember information about you such as your language preference or login information.
					<br>
					<br> Company: when this policy mentions "Company", "Travelpedia" "we," "us," or "our," it refers to Travelpedia that is responsible for your information under these Terms and Conditions.
					<br>
					<br> Country: where Travelpedia or the owners/founders of Travelpedia are based, in this case is the India.
					<br>
					<br> Customer: refers to the company, organization or person that signs up to use the Travelpedia Service.
					<br>
					<br> Device: any Internet connected device such as a phone, tablet, computer or any other device that can be used to visit our Website and use the Service.
					<br>
					<br> IP address: Every device connected to the Internet is assigned a number known as an Internet protocol (IP) address. 
					These numbers are usually assigned in geographic blocks. 
					An IP address can often be used to identify the location from which a device is connecting to the Internet.
					<br>
					<br> Personnel: refers to those individuals who are employed by Travelpedia or are under contract to perform a Service on behalf of one of the parties.
					<br>
					<br> Personal Data: any information that directly, indirectly, or in connection with other information —including a personal identification number —allows for the identification or identifiability of a natural person.
					<br>
					<br> Service: refers to the Service provided by Travelpedia as described in the relative terms (if available) and this platform.
					 In general, Travelpedia’ website and apps (hereinafter referred to as the “Website“).
					<br>
					<br> Third-party Service: refers to advertisers, contest sponsors, promotional and marketing partners, and others who provide our content or whose products or Service we think may interest you.
					<br>
					<br> Website: Travelpedia's site, which can be accessed via this URL
					<br>
					<br> You: a person or entity that is registered with Travelpedia to use the Services</p>	
				<h1>Restrictions</h1>
					<p>You agree not to, and you will not permit others to:
					<br>
					<br> License, sell, rent, lease, assign, distribute, transmit, host, outsource, disclose or otherwise commercially exploit the Service or make the platform available to any third party.
					<br>
					<br> Modify, make derivative works of, disassemble, decrypt, reverse compile or reverse engineer any part of the Service.
					<br>
					<br> Remove, alter or obscure any proprietary notice (including any notice of copyright or trademark) of ours or our affiliates, partners, suppliers or the licensors of the Service. </p>				
				<h1>Return and Refund Policy</h1>
					<p>We appreciate the fact that you like to buy the Service we provide. 
					We also want to make sure you have a rewarding experience while you're exploring, evaluating, and ordering our Service. 
					As with any purchasing experience there are terms and conditions that apply to transactions at our company. 
					In brief, the main thing to remember is that by placing an order or making a purchase from us, you agree to the Terms along with our Privacy Policy. 
					If, for any reason, You are not completely satisfied with any Product or Service that we provide, don't hesitate to contact us and we will try to discuss any of the issues you are going through with our Service or product‍<p>
				<h1>Your Suggestions</h1>
					<p>Any feedback, comments, ideas, improvements or suggestions (collectively, "Suggestions") provided by you to us with respect to the service shall remain the sole and exclusive property of us.
					 We shall be free to use, copy, modify, publish, or redistribute the Suggestions for any purpose and in any way without any credit or any compensation to you.</p>
				<h1>Your Consent</h1>
					<p> We've updated our Terms & Conditions to provide you with complete transparency into what is being set when you visit our app and how it's being used. 
					By using our Service, registering an account, or making a purchase, you hereby consent to our Terms & Conditions.</p>
        <h1>Links to Other Websites</h1>
					<p> Our Service may contain links to other websites that are not operated by Us. 
					If You click on a third party link, You will be directed to that third party's site. 
					We strongly advise You to review the Terms & Conditions of every site You visit. 
					We have no control over and assume no responsibility for the content, Terms & Conditions or practices of any third party site Service.</p>
				<h1>Cookies</h1>
					<p> We use "Cookies" to identify those areas of our website that you have visited. 
					A Cookie is a small piece of data stored on your computer or mobile device by your web browser. 
					We use Cookies to enhance the performance and functionality of our Service but are non-essential to their use. 
					However, without these cookies, certain functionality like videos may become unavailable or you would be required to enter your login details every time you visit our platform as we would not be able to remember that you had logged in previously. 
					Most web browsers can be set to disable the use of Cookies. 
					However, if you disable Cookies, you may not be able to access functionality on our website correctly or at all. 
					We never place Personally Identifiable Information in Cookies </p>
				<h1>Changes To Our Terms & Conditions</h1>
								<p>You acknowledge and agree that we may stop (permanently or temporarily) providing the Service (or any features within the Service) to you or to users generally at our sole discretion, without prior notice to you. You may stop using the Service at any time. You do not need to specifically inform us when you stop using the Service. You acknowledge and agree that if we disable access to your account, you may be prevented from accessing the Service, your account details or any files or other materials which are contained in your account. If we decide to change our Terms & Conditions we will post those changes on this page, and/or update the Terms & Conditions modification date below.</p>
								<h1>Modifications to Our service</h1>
								<p>We reserve the right to modify, suspend or discontinue, temporarily or permanently, the Service or any Service to which it connects, with or without notice and without liability to you.</p>
				<h1>Updates to Our service</h1>
									<p>We may from time to time provide enhancements or improvements to the features/functionality of the Service, which may include patches, bug fixes, updates, upgrades and other modifications ("Updates"). 
									Updates may modify or delete certain features and/or functionalities of the Service. 
									You agree that we have no obligation to (i) provide any Updates, or (ii) continue to provide or enable any particular features and/or functionalities of the Service to you. 
									You further agree that all Updates will be (i) deemed to constitute an integral part of the Service, and (ii) subject to these Terms and Conditions.</p>
				<h1>Third-Party Services</h1>
									<p>We may display, include or make available third-party content (including data, information, applications and other products Service) or provide links to third-party websites or Service ("Third-Party Service"). 
									You acknowledge and agree that we shall not be responsible for any Third-Party Service, including their accuracy, completeness, timeliness, validity, copyright compliance, legality, decency, quality or any other aspect thereof. 
									We do not assume and shall not have any liability or responsibility to you or any other person or entity for any Third-Party Service. 
									Third-Party Service and links thereto are provided solely as a convenience to you, and you access and use them entirely at your own risk and subject to such third parties' terms and conditions.</p>
				<h1>Term and Termination</h1>
									<p>These Terms and Conditions shall remain in effect until terminated by you or us. 
									We may, in our sole discretion, at any time and for any or no reason, suspend or terminate these Terms and Conditions with or without prior notice. 
									These Terms and Conditions will terminate immediately, without prior notice from us, in the event that you fail to comply with any provision of these Terms and Conditions. 
									Upon termination of these Terms and Conditions, you shall cease all of the Service and delete all copies of the Service from your computer. 
									Termination of these Terms and Conditions shall not limit any of our rights or remedies at law or in equity in case of breach by you (during the term of these Terms and Conditions) of any of your obligations under the present Terms and Conditions. </p>
				<h1>Copyrighted Material</h1>
									<p>If you are a copyright owner or such owner's agent and believe any material from us constitutes an infringement on your copyright, please contact us setting forth the following information: (a) a physical or electronic signature of the copyright owner or a person authorized to act on his behalf; (b) identification of the material that is claimed to be infringing; (c) your contact information, including your address, telephone number, and email; (d) a statement by you that our use of the material is not authorized by the copyright owners; and (e) a statement that the information in the notification is accurate, and, under penalty of perjury you are authorized to act on behalf of the owner.</p>
													<h1>Indemnification</h1>
									<p>You agree to indemnify and hold us and our parents, subsidiaries, affiliates, officers, employees, agents, partners and licensors (if any) harmless from any claim or demand, including reasonable attorneys' fees, due to or arising out of your: (a) use of the Service; (b) violation of these Terms and Conditions or any law or regulation; or (c) violation of any right of a third party.</p>
				<h1>No Warranties</h1>
									<p>The Service as well as any information furnished by us to you (including Confidential Information) is provided to you "AS IS" and "AS AVAILABLE" and with all faults and defects without warranty of any kind. To the maximum extent permitted under applicable law, we, on our own behalf and on behalf of our affiliates and our respective licensors and Service providers, expressly disclaim all warranties, whether express, implied, statutory or otherwise, with respect to the Service, including all implied warranties of merchantability, fitness for a particular purpose, title and non-infringement, and warranties that may arise out of course of dealing, course of performance, usage or trade practice. Without limitation to the foregoing, we provide no warranty or undertaking, and makes no representation of any kind that the Service will meet your requirements, achieve any intended results, be compatible or work with any other software, websites, systems or service, operate without interruption to any performance or reliability standards or to be free from any errors or that defects can or will be corrected.</p>
									<br>
									<p>Without limiting the foregoing, neither us nor any provider makes any representation or warranty of any kind, express or implied: (i) as to the operation or availability of the Service, or the information, content, and materials or products included thereon; (ii) that the Service will be uninterrupted or error-free; (iii) as to the accuracy, reliability, or currency of any information or content provided through the Service; or (iv) that the Service, its servers, the content, or e-mails sent from or on behalf of us are free of viruses, scripts, trojan horses, worms, malware, timebombs or other harmful components. Some jurisdictions do not allow the exclusion of or limitations on implied warranties or the limitations on the applicable statutory rights of a consumer, hence some or all of the above exclusions and limitations may not apply to you.</p>
				<h1>Limitation of Liability</h1>
									<p>Notwithstanding any damages that you might incur, the entire liability of us and any of our suppliers under any provision of these Terms and Conditions and your exclusive remedy for all of the foregoing shall be limited to the amount actually paid by you for the Service. 
									To the maximum extent permitted by applicable law, in no event shall we or our suppliers be liable for any special, incidental, indirect, or consequential damages whatsoever (including, but not limited to, damages for loss of profits, for loss of data or other information, for business interruption, for personal injury, for loss of privacy arising out of or in any way related to the use of or inability to use the Service, third-party software and/or third-party hardware used with the Service or otherwise in connection with any provision of these Terms and Conditions), even if we or any supplier has been advised of the possibility of such damages and even if the remedy fails of its essential purpose. 
									Some states/jurisdictions do not allow the exclusion or limitation of incidental or consequential damages, so the above limitation or exclusion may not apply to you.</p>
				<h1>Severability</h1>
									<p>If any provision of these Terms and Conditions is held to be unenforceable or invalid, such provision will be changed and interpreted to accomplish the objectives of such provision to the greatest extent possible under applicable law and the remaining provisions will continue in full force and effect. 
									These Terms and Conditions, together with the Privacy Policy and any other legal notices published by us on the Service, shall constitute the entire agreement between you and us concerning the Service. 
									No waiver of any term of these Terms and Conditions shall be deemed a further or continuing waiver of such term or any other term, and our failure to assert any right or provision under these Terms and Conditions shall not constitute a waiver of such right or provision. YOU AND US AGREE THAT ANY CAUSE OF ACTION ARISING OUT OF OR RELATED TO THE SERVICES MUST COMMENCE WITHIN ONE (1) YEAR AFTER THE CAUSE OF ACTION ACCRUES OTHERWISE SUCH CAUSE OF ACTION IS PERMANENTLY BARRED.</p>
				<h1>Waiver</h1>
									<p>Except as provided herein, the failure to exercise a right or to require performance of an obligation under this Agreement shall not effect a party's ability to exercise such right or require such performance at any time thereafter nor shall be the waiver of a breach constitute waiver of any subsequent breach.</p>
									<br>	
									<p>No failure to exercise, and no delay in exercising, on the part of either party, any right or any power under this Agreement shall operate as a waiver of that right or power. 
									Nor shall any single or partial exercise of any right or power under this Agreement preclude further exercise of that or any other right granted herein. 
									In the event of a conflict between this Agreement and any applicable purchase or other terms, the terms of this Agreement shall govern.</p>
        <h1>Entire Agreement</h1>
									<p>These Terms and Conditions, along with our Privacy Policy, Cookies Policy, Confidentiality and Intellectual Property Policy and any other notice or policy we may provide henceforth, all as may be amended from time to time, constitutes the entire agreement between you and us regarding your use of the Service and supersedes all prior and contemporaneous written or oral agreements between you and us. 
									You may be subject to additional terms and conditions that apply when you use or purchase other Service from us, which we will provide to you at the time of such use or purchase.</p>
				<h1>Updates to Our Terms</h1>
									<p>We may change our Service and policies, and we may need to make changes to these Terms so that they accurately reflect our Service and policies. 
									Unless otherwise required by law, we will notify you (for example, through our Service) before we make changes to these Terms and give you an opportunity to review them before they go into effect. 
									Then, if you continue to use the Service, you will be bound by the updated Terms. 
									If you do not want to agree to these or any updated Terms, you can delete your account.</p>
				<h1>Intellectual Property</h1>
									<p>Our platform and its entire contents, features and functionality (including but not limited to all information, software, text, displays, images, video and audio, and the design, selection and arrangement thereof), are owned by us, its licensors or other providers of such material and are protected by and international copyright, trademark, patent, trade secret and other intellectual property or proprietary rights laws. The material may not be copied, modified, reproduced, downloaded or distributed in any way, in whole or in part, without the express prior written permission of us, unless and except as is expressly provided in these Terms & Conditions. Any unauthorized use of the material is prohibited.</p>
				<h1>Agreement to Arbitrate</h1>
									<p>This section applies to any dispute EXCEPT IT DOESN’T INCLUDE A DISPUTE RELATING TO CLAIMS FOR INJUNCTIVE OR EQUITABLE RELIEF REGARDING THE ENFORCEMENT OR VALIDITY OF YOUR OR ’s INTELLECTUAL PROPERTY RIGHTS. 
									The term “dispute” means any dispute, action, or other controversy between you and us concerning the Services or this agreement, whether in contract, warranty, tort, statute, regulation, ordinance, or any other legal or equitable basis. 
									“Dispute” will be given the broadest possible meaning allowable under law.</p>
				<h1>Notice of Dispute</h1>
									<p>In the event of a dispute, you or us must give the other a Notice of Dispute, which is a written statement that sets forth the name, address, and contact information of the party giving it, the facts giving rise to the dispute, and the relief requested. 
									You must send any Notice of Dispute via email to: . We will send any Notice of Dispute to you by mail to your address if we have it, or otherwise to your email address. 
									You and us will attempt to resolve any dispute through informal negotiation within sixty (60) days from the date the Notice of Dispute is sent. 
									After sixty (60) days, you or us may commence arbitration.</p>
				<h1>Binding Arbitration</h1>
									<p>If you and us don’t resolve any dispute by informal negotiation, any other effort to resolve the dispute will be conducted exclusively by binding arbitration as described in this section. 
									You are giving up the right to litigate (or participate in as a party or class member) all disputes in court before a judge or jury. 
									The dispute shall be settled by binding arbitration in accordance with the commercial arbitration rules of the American Arbitration Association. 
									Either party may seek any interim or preliminary injunctive relief from any court of competent jurisdiction, as necessary to protect the party’s rights or property pending the completion of arbitration. 
									Any and all legal, accounting, and other costs, fees, and expenses incurred by the prevailing party shall be borne by the non-prevailing party.</p>
				<h1>Submissions and Privacy</h1>
									<p>In the event that you submit or post any ideas, creative suggestions, designs, photographs, information, advertisements, data or proposals, including ideas for new or improved products, services, features, technologies or promotions, you expressly agree that such submissions will automatically be treated as non- confidential and non-proprietary and will become the sole property of us without any compensation or credit to you whatsoever. 
									We and our affiliates shall have no obligations with respect to such submissions or posts and may use the ideas contained in such submissions or posts for any purposes in any medium in perpetuity, including, but not limited to, developing, manufacturing, and marketing products and services using such ideas.</p>
				<h1>Promotions</h1>
									<p>We may, from time to time, include contests, promotions, sweepstakes, or other activities (“Promotions”) that require you to submit material or information concerning yourself. 
									Please note that all Promotions may be governed by separate rules that may contain certain eligibility requirements, such as restrictions as to age and geographic location. 
									You are responsible to read all Promotions rules to determine whether or not you are eligible to participate.
									If you enter any Promotion, you agree to abide by and to comply with all Promotions Rules. 
									Additional terms and conditions may apply to purchases of goods or services on or through the Services, which terms and conditions are made a part of this Agreement by this reference.</p>
				<h1>Typographical Errors</h1>
									<p>In the event a product and/or service is listed at an incorrect price or with incorrect information due to typographical error, we shall have the right to refuse or cancel any orders placed for the product and/ or service listed at the incorrect price. We shall have the right to refuse or cancel any such order whether or not the order has been confirmed and your credit card charged. If your credit card has already been charged for the purchase and your order is canceled, we shall immediately issue a credit to your credit card account or other payment account in the amount of the charge.</p>
				<h1>Miscellaneous</h1>
									<p>If for any reason a court of competent jurisdiction finds any provision or portion of these Terms & Conditions to be unenforceable, the remainder of these Terms & Conditions will continue in full force and effect. 
									Any waiver of any provision of these Terms & Conditions will be effective only if in writing and signed by an authorized representative of us. 
									We will be entitled to injunctive or other equitable relief (without the obligations of posting any bond or surety) in the event of any breach or anticipatory breach by you. 
									We operate and control our Service from our offices in. 
									The Service is not intended for distribution to or use by any person or entity in any jurisdiction or country where such distribution or use would be contrary to law or regulation. 
									Accordingly, those persons who choose to access our Service from other locations do so on their own initiative and are solely responsible for compliance with local laws, if and to the extent local laws are applicable. 
									These Terms & Conditions (which include and incorporate our Privacy Policy) contains the entire understanding, and supersedes all prior understandings, between you and us concerning its subject matter, and cannot be changed or modified by you. 
									The section headings used in this Agreement are for convenience only and will not be given any legal import.</p>
				<h1>Disclaimer</h1>
									<p>We are not responsible for any content, code or any other imprecision. 
									   We do not provide warranties or guarantees.
									   In no event shall we be liable for any special, direct, indirect, consequential, or incidental damages or any damages whatsoever, whether in an action of contract, negligence or other tort, arising out of or in connection with the use of the Service or the contents of the Service. We reserve the right to make additions, deletions, or modifications to the contents on the Service at any time without prior notice.</p>
									<br>
									<p>Our Service and its contents are provided "as is" and "as available" without any warranty or representations of any kind, whether express or implied.
									   We are a distributor and not a publisher of the content supplied by third parties; as such, our exercises no editorial control over such content and makes no warranty or representation as to the accuracy, reliability or currency of any information, content, service or merchandise provided through or accessible via our Service. 
									   Without limiting the foregoing, We specifically disclaim all warranties and representations in any content transmitted on or in connection with our Service or on apps that may appear as links on our Service, or in the products provided as a part of, or otherwise in connection with, our Service, including without limitation any warranties of merchantability, fitness for a particular purpose or non-infringement of third party rights.
									   No oral advice or written information given by us or any of its affiliates, employees, officers, directors, agents, or the like will create a warranty. 
									   Price and availability information is subject to change without notice. 
									   Without limiting the foregoing, we do not warrant that our Service will be uninterrupted, uncorrupted, timely, or error-free.</p>					
        <h1>Contact Us</h1>
									<p>Don't hesitate to contact us if you have any questions</p>
									<p>Via Email: <a href="mailto:support@rewardpi.com">support@rewardpi.com</a></p>
			</div>
		</div>
	</div>
</body>
</html>      
""";

class _TermAndConState extends State<TermAndCon> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Terms & Conditions",
          textScaleFactor: 1.2,
          style: TextStyle(
            fontFamily: "Pacifico-Regular",
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Html(
          data: htmlData,
          tagsList: Html.tags,
        ),
      ),
    );
  }
}
