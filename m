Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A75FA4E496
	for <lists+nouveau@lfdr.de>; Tue,  4 Mar 2025 17:00:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A005E10E5EE;
	Tue,  4 Mar 2025 16:00:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=l3harris.com header.i=@l3harris.com header.b="Q0tew2Zo";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
X-Greylist: delayed 303 seconds by postgrey-1.36 at gabe;
 Tue, 04 Mar 2025 16:00:12 UTC
Received: from USMLB1RNPMX01POUT.l3harris.com (usmlb1rnpmx01pout.l3harris.com
 [192.52.235.36])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6834210E62B
 for <nouveau@lists.freedesktop.org>; Tue,  4 Mar 2025 16:00:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=l3harris.com; i=@l3harris.com; q=dns/txt; s=mail;
 t=1741104013; x=1772640013;
 h=from:to:subject:date:message-id:mime-version;
 bh=1wMVk7Flz8DfVYoHHhlA3lASTB7AMHxh6tKoP+nQEd8=;
 b=Q0tew2ZoAzRFIca5UEacdMiHdSHCo/iJeGEDEjF7GLA9BRTL5iLTazTQ
 qI+3HE5hCxzeTieCxx1UGUIBxlniKPq4dtcD2fz2AviBOaOThlCjyix8t
 4Q2XTUWqBjHKpKxHjnwWG8Uv3IkF4Geyft39C0RfLG8Zqo+KUpSqGz/kE
 VLGIkXIMrS6xJmYa5PCqCy8jqSydQKyDeH6AMSTVeR1Axjl+KyJ3kfb+M
 WWG4f2E1hKO6BC2o0xrKEVQSzqFN7tPWmPUb+P0EoR5COjLUoaskq4a6F
 LR/XvvltK9cd4dGBjogt0D3JbLoszakeRRoomTZtTDu8P0xc1UpxC/XF+ A==;
X-CSE-ConnectionGUID: ZSIzR9VgSc6XfAYvYAZFsA==
X-CSE-MsgGUID: WIzpU+gERlaSmwgknioq4A==
X-IronPort-AV: E=Sophos;i="6.14,220,1736812800"; 
 d="scan'208,217";a="154431688"
Received: from unknown (HELO USMLB1RNPRT03POUT.l3harris.com) ([10.64.225.9])
 by USMLB1RNPMX01POUT.l3harris.com with ESMTP; 04 Mar 2025 15:55:08 +0000
X-CSE-ConnectionGUID: aWZgM4cnSNGFeYNyKZsc8Q==
X-CSE-MsgGUID: 67W3kgYyTG2yU2V71CN38Q==
X-filenames: 
X-filesizes: None
X-filetypes: 
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,220,1736812800"; 
 d="scan'208,217";a="238273508"
Received: from win-p1000844.rootforest.com (HELO mail.l3t.com) ([10.95.208.10])
 by USMLB1RNPRT03POUT.l3harris.com with ESMTP; 04 Mar 2025 15:55:04 +0000
Received: from WIN-P1000847.rootforest.com (10.95.208.7) by
 WIN-P1000844.rootforest.com (10.95.208.10) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.20; Tue, 4 Mar 2025 15:55:02 +0000
Received: from USG02-BN3-obe.outbound.protection.office365.us (23.103.199.143)
 by WIN-P1000847.rootforest.com (10.95.208.7) with Microsoft SMTP
 Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.20 via Frontend Transport; Tue, 4 Mar 2025 15:55:02 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector5401; d=microsoft.com; cv=none;
 b=GBRZ8PTu0UfiY/5J7EqkCX06uqMmP0ofEudfrkSXea9vcYATYafnPbwA0lngwvPhOh09ruG+GHM5aggHP9CsGRDd1R6hlyBZsJS5awO5f3kQxw4VjW3rsUH5aZXfc/Z8C/nC7BZqBstZIGpNdQ1EOw8fQMMB+7g9go7Tkh/RMDiAwWu2OTpccAlnwN6GE9RVCWBigCgF5OgRw+VAuCIXEku2SIjhHuPaLU48YvAzFNU57PHEO2PXzvHzT1esSH/mioPCWlBYjPWDR9Eql0Be9UVrtYSU1ar6dC9m8fOnwfT5ujLqTsvYuHltJM34fn/uNEJIwJnA4VjqPM2Er+elpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector5401;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Xm/Xfwq9VD+h1d/RvhL+qsjIf2HRqzzUPY79dbxW3dA=;
 b=TT5egK6xlKTr6XEeyUxfWsiRNUfsisBKX8MMyPgosDOu9yZEHWnZhAooDX1PnhIXb0M67uUkOdmVQek9+fDPt5kD/GJa6mJon6l1DgOxidQL/hhGYjON6CHg1TwVodvJTpVCdRKVrJsWm1kjdlAH0XUnpUzSE+n6jBRIeDUhXYkWwa4v9p+zRVe+iauBD2ehGmhJXmsm7wY8fpJzyrgpHDUj+YORElrvHZkjcNob7C0qiGEOttp8YSM0CuF0AR7wKEcWKFsPolRUhXbTUkttYYXKWvV3iJuWVw+cFGP6DscsxzAxMQzLsQKHLsE663jauT4P5ubydWXxxUDeJqmT7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=l3harris.com; dmarc=pass action=none header.from=l3harris.com;
 dkim=pass header.d=l3harris.com; arc=none
Received: from SA1P110MB2005.NAMP110.PROD.OUTLOOK.COM (2001:489a:200:1aa::14)
 by SA1P110MB1133.NAMP110.PROD.OUTLOOK.COM (2001:489a:200:171::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.26; Tue, 4 Mar
 2025 15:55:01 +0000
Received: from SA1P110MB2005.NAMP110.PROD.OUTLOOK.COM
 ([fe80::266f:d560:6be8:c150]) by SA1P110MB2005.NAMP110.PROD.OUTLOOK.COM
 ([fe80::266f:d560:6be8:c150%6]) with mapi id 15.20.8445.022; Tue, 4 Mar 2025
 15:55:01 +0000
From: <jeff.vandorp@L3Harris.com>
To: <nouveau@lists.freedesktop.org>
Subject: Support of RTX A2000
Thread-Topic: Support of RTX A2000
Thread-Index: AduNHTxmOhQa7mUQSxeEibWLYEKLEQ==
Date: Tue, 4 Mar 2025 15:55:01 +0000
Message-ID: <SA1P110MB20051F218BC8DF86AC5419D9A8C8A@SA1P110MB2005.NAMP110.PROD.OUTLOOK.COM>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=L3Harris.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA1P110MB2005:EE_|SA1P110MB1133:EE_
x-ms-office365-filtering-correlation-id: a8707593-c10c-484d-d621-08dd5b34ec51
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|1800799024|38070700018|8096899003; 
x-microsoft-antispam-message-info: =?us-ascii?Q?1WR6xiKVZuVtmSRVVdj0+0PVa+BHOO/2+fXeBScUZRltao5iwazqkVFENjkE?=
 =?us-ascii?Q?QZZN3tqRwV9UqPvF5sHY41RalAX3Otay2GVoNNzZ/fokyS+bZlMJZWaw/kF3?=
 =?us-ascii?Q?LvorlbzyCfGiKSvgElBul3SxuLDN6CcV3Pa/XckxHJkt0J3Q8jQ9BQ3BcV1J?=
 =?us-ascii?Q?TX80RCh5XKQBTcP/gnFekP8/xzrjeITjoje3MoSFmkiZ8diRRLITptku/dSh?=
 =?us-ascii?Q?IYpIJDYt4Q5tvHbm2EuwaR3jwIASQG5zYwyG21gDYto3A0UjY5drfJ7vQT/z?=
 =?us-ascii?Q?NuRhB3FOKf4MPX7T4DH6eXh8QczkpwoSocbHjalwvBnu7Z/LT6kewsfPRfsg?=
 =?us-ascii?Q?SwpMNx6RvvTgPqIxuK0lcxG5s4+TSpAQLX4Vg/pEgRaPHnxFf636pRmA+APH?=
 =?us-ascii?Q?w5b1K6w2Td59qJTAFEqcM6WkQbxCSGIAiPNUcPeIWJxNHCLJA+zSa/xxbNoR?=
 =?us-ascii?Q?eCVVaNUFNW4HRNeitit2DuFuqMsZuIqVNZWauxHUdnBtMPiUPPj2LNwTUszO?=
 =?us-ascii?Q?F+mGSnmi2WlKRT8d0dRuC/wSQvsDXSBr1c5BkrHqTT2E3EM2sNokqd2TXnHf?=
 =?us-ascii?Q?V/VwbiYzxbcb4bSuG6hZn6/lmmX8BiyXEDdADngsy0srbRzw8iaanqTXaQqI?=
 =?us-ascii?Q?IJ5RvIzzKK21U+xvUFf+XDhUi78o0vfvO+9nMN85+RQyt9eqsTspZhmHg0pG?=
 =?us-ascii?Q?1NpwfQdrZwH7FVpV7NXoYo+VPOp5Sra77dpYKEtgkkTZm0ZFrDjcH85HLR4I?=
 =?us-ascii?Q?zELU2UXhPxwaQp1I0IxBtX0OUDcCk9C+EHaRyjWZnILj8LzMfCFkjojkHf6f?=
 =?us-ascii?Q?pbAviCC7XY/EGSyQFw/hA7p+MGr+sDsGwau2QN2kOjCG+mSwYxIBJR2x7SAJ?=
 =?us-ascii?Q?Owr4i7FaYm3pUprCHX1qaSv77ObEo1h3sYZdKP0nACsg5QpgOK8aQHd1dpWU?=
 =?us-ascii?Q?KKbXObMF/ogRxTkwBnAx8ccohUBOZSvbgvbTJjYiKGwlERZOZ6VBX7iNerS/?=
 =?us-ascii?Q?fb4QM/hjQi4owTckiy3dMyoHjiUaIeuZu6Xr28+4TQVKzY0qfF6bzQxzLo0c?=
 =?us-ascii?Q?blUxJUHMuCo2tyxG75XWdsNR9bohUC9Ik8P85B71k8OejVUZIVUAyU2ts2kn?=
 =?us-ascii?Q?cZsfYUwAfagQH87auqS6lUwfapIqXcpUADvTiGf3Src/4B55mTBkDOIh08LP?=
 =?us-ascii?Q?gpdT7G4/WL0DTZeBz/oiSuOS2U2+lwEpGa7wXRGYrO5+tyHSjd3LWSytob4V?=
 =?us-ascii?Q?npQNT5NVJgi9OPMV4c5DaUxYufRloNrOTXwOBdbqDV44QSaKaSdqz7HJV1I6?=
 =?us-ascii?Q?mw8uknmJFR+ZRdJ1dAHaTau9gtNrEGTU3AD8d9qYZ3+0er69pC9kXzLzSTas?=
 =?us-ascii?Q?LV6H2xYaEf3tFCAyR65bJmn9js6SqoSTGi0tF/kEL5/hlmhjcNBwhub8IQ3c?=
 =?us-ascii?Q?Qa0kIOG0dEAz/xCUPpxXKEl/cnESZk8D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1P110MB2005.NAMP110.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(38070700018)(8096899003); DIR:OUT; SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?3dHhDILJJJ6AHoC8YNO9Y15WPX7sSbHg6eN/UXo8UKqGrdIDBMd6aePYbg/Q?=
 =?us-ascii?Q?WQZkJ8o0RDGpT0u7A3hFDMKF2DBWji8NTkr7iISZpsvSdOPHypBoH5By1Bgj?=
 =?us-ascii?Q?uiX7QGMyJzJ3krJqPWupQk0OMxLupjejToSCBeJ8yAAVd5QiUFtLsPBI4emD?=
 =?us-ascii?Q?cjyI/Rpr0sJhkwn1VeIrexb4f4+BE9h6pia+0kmuFe+q3T8OGPuAH06Ig8Fv?=
 =?us-ascii?Q?pNwT1YPax8LX+EmMXxPkiFvTGFh2YfaqT8vonyv/QGT/o28ONZ8Bt7SmRBu6?=
 =?us-ascii?Q?9eDbvQyn893PwQVWwjQDzEFGedV+1ZwtC9X61Onyytl+qBlgZg2WE8UkLKTd?=
 =?us-ascii?Q?kaiSIbq56KwaJXHhlqr4VbIxUIu5n1Fdvw+cG5EFXEh5wCQ5dG5Tt5h1cvck?=
 =?us-ascii?Q?KtV2lwjuyXawKURwn34Tv7otVj/iqbmiQng3AAQOkVE9P1dxfJw6KcqcTB2Q?=
 =?us-ascii?Q?oaIcfoqp8CxcmjYyFyYQ/eOnEv5ByiLJ0faCw2XF37pFFKPTA/NPsPGg3Vr0?=
 =?us-ascii?Q?FmIKqF6CfjIOZKr7aB9dgmdr8euIGEwE8JH7X8Q5nsqYIKtT7egy32cNKb5G?=
 =?us-ascii?Q?HZY9fL64EnJQrlv5BUqi2ibHmYUEilY2TEEHPVOg8ZxdoV5MP3pg5vpVgiEm?=
 =?us-ascii?Q?1VeilJ+jfWc0/01+2ya1GXeqkrhmR9YT/m4uUWjR+h0nYMy9Q3GNSTUBv2cm?=
 =?us-ascii?Q?aNlWUGK97YjUUgPqtYuwQS/sbJ7pKoAnUecuu9J13i6LRKtXRbHnVYu6pca1?=
 =?us-ascii?Q?WFe8ML6JYwNZkshfyD36oTaa2lUhHS0Z3HeY50xeJwf53ZVNVb2nMQj53Yvj?=
 =?us-ascii?Q?q2Yib3MGSimvEHCxemsseJVkcTCb9aOCtL+pW+OTGcu0d9H69wSw98bIEdIK?=
 =?us-ascii?Q?3u1/ahs74odLK+lP4iJUtV51mM8WT9QQMu2EZ5Hzk9LvvqNhyzEX/parT10R?=
 =?us-ascii?Q?aQhIwuBcgxD137lDXRW4gwrmHP/oeTKblVQCBiLwpWmF0VpIichY+yehEHpu?=
 =?us-ascii?Q?PGgdbzt+cUx31xBBWF0iY6qqsN0T9BV4tfNEPBojFdo46fECeDj/hxO19jMI?=
 =?us-ascii?Q?OJpS/aAU8FBanitaUM0FL/ZpXfkNWCKMusFF5jTxWPjOWyzZJHRPhfqx+ByQ?=
 =?us-ascii?Q?oc/3aT6x4U4P/D9d75Ur4g3vvTgzsOPukTTF90Kjov7daePn09txl5IfH5WW?=
 =?us-ascii?Q?wUBbOEWb1vXjz29JcaztDjMONW55iQeqrswnRlyvgyQAP4VsANuh5Ae4V4+H?=
 =?us-ascii?Q?8PjR/KDOvZNCyTAxSuM52/TyVBzvDA3pmrXhtzNKCLRC87uMbR6awpmnBtr1?=
 =?us-ascii?Q?R0c01pQR/yZBMShFuEMM9KwXzmqRWMemVr2c6FtjlbNIYr/72GbqErBS3dqS?=
 =?us-ascii?Q?c1xrLGSFWfePSKCaXbG6mEaZRZQEsBDQec7elsLVvvDgd23eFBKUutTCmNB9?=
 =?us-ascii?Q?qkLjUc6R8SLGufTRQ1GoAcHXfYgcmJLReAiUnUb+7B466trgSSQG5LIl+/Bn?=
 =?us-ascii?Q?HgQudjx+xzO2u9dNv9ZKC0LoDCDXpKDFAgv0?=
Content-Type: multipart/alternative;
 boundary="_000_SA1P110MB20051F218BC8DF86AC5419D9A8C8ASA1P110MB2005NAMP_"
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA1P110MB2005.NAMP110.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: a8707593-c10c-484d-d621-08dd5b34ec51
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Mar 2025 15:55:01.7208 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: ba488c5e-f105-4a2b-a8b1-b57b26a44117
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1P110MB1133
X-OriginatorOrg: L3Harris.com
X-BeenThere: nouveau@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request@lists.freedesktop.org?subject=subscribe>
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

--_000_SA1P110MB20051F218BC8DF86AC5419D9A8C8ASA1P110MB2005NAMP_
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

What support does Nouveau have for the RTX A2000?   I don't see it specific=
ally listed on the "CodeNames.html" page.  I'm assuming it would fall eithe=
r in the Turing or Ampere families, but its not clear.

Jeff VanDorp

  =


CONFIDENTIALITY NOTICE: This email and any attachments are for the sole use=
 of the intended recipient and may contain material that is proprietary, co=
nfidential, privileged or otherwise legally protected or restricted under a=
pplicable government laws. Any review, disclosure, distributing or other us=
e without expressed permission of the sender is strictly prohibited. If you=
 are not the intended recipient, please contact the sender and delete all c=
opies without reading, printing, or saving.


--_000_SA1P110MB20051F218BC8DF86AC5419D9A8C8ASA1P110MB2005NAMP_
Content-Type: text/html; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-micr=
osoft-com:office:office" xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" xmlns=3D"http:=
//www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii">
<meta name=3D"Generator" content=3D"Microsoft Word 15 (filtered medium)">
<style><!--
/* Font Definitions */
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Aptos;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0in;
	font-size:11.0pt;
	font-family:"Aptos",sans-serif;
	mso-ligatures:standardcontextual;}
span.EmailStyle17
	{mso-style-type:personal-compose;
	font-family:"Aptos",sans-serif;
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-size:11.0pt;}
@page WordSection1
	{size:8.5in 11.0in;
	margin:1.0in 1.0in 1.0in 1.0in;}
div.WordSection1
	{page:WordSection1;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]-->
</head>
<body lang=3D"EN-US" link=3D"#467886" vlink=3D"#96607D" style=3D"word-wrap:=
break-word">
<div class=3D"WordSection1">
<p class=3D"MsoNormal">What support does Nouveau have for the RTX A2000?&nb=
sp; &nbsp;I don&#8217;t see it specifically listed on the &#8220;CodeNames.=
html&#8221; page.&nbsp; I&#8217;m assuming it would fall either in the Turi=
ng or Ampere families, but its not clear.<o:p></o:p></p>
<p class=3D"MsoNormal"><br>
Jeff VanDorp<o:p></o:p></p>
</div>
<span><span><br>&nbsp;</span>&nbsp;</span><br>
<DIV><span style=3D"FONT-FAMILY: Times New Roman"><span style=3D"FONT-SIZE:=
 14px">CONFIDENTIALITY NOTICE: This email and any attachments are for the s=
ole use of the intended recipient and may contain material that is propriet=
ary, confidential, privileged or otherwise legally protected or restricted =
under applicable government laws. Any review, disclosure, distributing or o=
ther use without expressed permission of the sender is strictly prohibited.=
 If you are not the intended recipient, please contact the sender and delet=
e all copies without reading, printing, or saving.</span></span>
<DIV style=3D'FONT-SIZE: 14px; FONT-FAMILY: "Times New Roman"'><br></DIV></=
DIV></body>
</html>

--_000_SA1P110MB20051F218BC8DF86AC5419D9A8C8ASA1P110MB2005NAMP_--

