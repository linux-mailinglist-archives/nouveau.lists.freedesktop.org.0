Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 15565495A3F
	for <lists+nouveau@lfdr.de>; Fri, 21 Jan 2022 08:00:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7513A10E5C3;
	Fri, 21 Jan 2022 07:00:41 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from zappa.azrackspace.net (zappa.azrackspace.net
 [IPv6:2602:41:65b8:d100:0:5a:4150:5041])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F8C510E670
 for <nouveau@lists.freedesktop.org>; Fri, 21 Jan 2022 05:07:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=glowingmonkey.org; s=default; h=Content-Type:References:In-Reply-To:Date:
 Subject:From:To:MIME-Version:Message-ID:Content-Transfer-Encoding;
 bh=qvtxFsgxQeUkvysRetyO8b//WpyqjM7ify37jJ8TlpQ=; b=gfsnXMhJtYqtLHh3exPIE+r5mZ
 zdNffei5KDorQqSVLznfussbLAgs6KWoJuPSNZuqVDsyMFxP/Hhp9Y1NBR+PFTudicZq8nWtA1r+z
 rX30jJRA+tn4B+tvxzea93akD;
Received: from localhost ([127.0.0.1])
 by zappa.azrackspace.net with esmtp (Exim 4.92)
 (envelope-from <nick@glowingmonkey.org>)
 id 1nAm8h-00084e-Uu; Thu, 20 Jan 2022 22:07:08 -0700
X-Virus-Scanned: Debian amavisd-new at zappa.azrackspace.net
X-Spam-Flag: NO
X-Spam-Score: -0.859
X-Spam-Level: 
X-Spam-Status: No, score=-0.859 tagged_above=-100 required=6.31
 tests=[ALL_TRUSTED=-1, HTML_MESSAGE=0.001, MISSING_MID=0.14]
 autolearn=disabled
Received: from zappa.azrackspace.net ([IPv6:::1])
 by localhost (zappa.azrackspace.net [IPv6:::1]) (amavisd-new, port 10024)
 with ESMTP id fdaXBHgij3E4; Thu, 20 Jan 2022 22:07:06 -0700 (MST)
Received: from [10.20.30.47] (helo=[IPv6:::ffff:10.20.30.47])
 by zappa.azrackspace.net with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <nick@glowingmonkey.org>)
 id 1nAm8g-000840-Jl; Thu, 20 Jan 2022 22:07:06 -0700
MIME-Version: 1.0
To: Ilia Mirkin <imirkin@alum.mit.edu>
From: Nick Lopez <nick@glowingmonkey.org>
Date: Thu, 20 Jan 2022 22:07:06 -0700
Importance: normal
X-Priority: 3
In-Reply-To: <CAKb7Uvi4+=7PTATZMh0vHcX8pg0FqR48r4_1MHphZKYQu1=hEw@mail.gmail.com>
References: <20220120181657.8E3BB10E684@gabe.freedesktop.org>
 <CAKb7Uvi4+=7PTATZMh0vHcX8pg0FqR48r4_1MHphZKYQu1=hEw@mail.gmail.com>
Content-Type: multipart/alternative;
 boundary="_55DAD5ED-4B06-4189-BB8F-EE40A212A12B_"
X-Mailman-Approved-At: Fri, 21 Jan 2022 07:00:40 +0000
Subject: Re: [Nouveau] Off-by-one or bad BIOS image? Apple eMac 800 GeForce
 2MX
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
Cc: "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>
Message-Id: <20220121070041.7513A10E5C3@gabe.freedesktop.org>

--_55DAD5ED-4B06-4189-BB8F-EE40A212A12B_
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

If it=E2=80=99s correct I=E2=80=99d like to see it make its way upstream. I=
 have no idea what the submission procedure is.

From: Ilia Mirkin
Sent: Thursday, January 20, 2022 11:24 AM
To: Nick Lopez
Cc: nouveau@lists.freedesktop.org
Subject: Re: [Nouveau] Off-by-one or bad BIOS image? Apple eMac 800 GeForce=
 2MX

This stuff is always so confusing. Let's think this through.... if
bios size is 4, and we're trying to read a 4-byte thing starting at
address 0, that _ought_ to work, I think. So in my strawman case,
bios->size =3D=3D 4, and size =3D=3D 4. So we should only error if size >
bios->size, not if they're =3D=3D. Looks like your patch is right.

Want to make a linux kernel patch submission with this? (i.e.
including changelog, signoff, etc?)

Cheers,

  -ilia

On Thu, Jan 20, 2022 at 1:17 PM Nick Lopez <nick@glowingmonkey.org> wrote:
>
> Because I watch too much retro YouTube I decided it was a good idea to tr=
y installing Adelie Linux on my old G4/800 eMac, but the Live installer wou=
ld freeze. By blacklisting nouveau I was able to get it booted and manually=
 installed and, after hours and hours of compiling, get a working kernel tr=
ee to poke at. After only a few iterations with dump_stack() and nvkm_debug=
 and the output of envytools/nvbios I worked out at the last initscript ins=
truction was stored in the last byte of the ROM. I think the bounds check i=
n the nvbios_addr() function is miscalculating the limit as one byte short,=
 that=E2=80=99s why I was seeing this in the syslog:
>
>
>
> nouveau 0000:00:10.0: bios: OOB 1 000007b2 000007b2
>
> nouveau 0000:00:10.0: devinit: 0x000007b2[ ]: unknown opcode 0x00
>
> nouveau 0000:00:10.0: preinit failed with -22
>
> nouveau: DRM-master:00000000:00000080: init failed with -22
>
> nouveau 0000:00:10.0: DRM-master: Device allocation failed: -22
>
> nouveau: probe of 0000:00:10.0 failed with error -22
>
>
>
> After I changed the limit check from:
>
> if (unlikely(*addr + size >=3D bios->size)) {
>
> to:
>
> if (unlikely(*addr + size > bios->size)) {
>
>
>
> it initialized the card properly, brought up the fbconsole and even seems=
 to be working in X with DRI. So the question is: was the bounds check wron=
g, or is the NVDA,BMP image provided by OpenFirmware truncated? I=E2=80=99m=
 guess this doesn=E2=80=99t turn up elsewhere because the ROM images read t=
hrough any of the other methods are the size of flash chip they=E2=80=99re =
stored on so there=E2=80=99s always unused space at the end and they never =
use the last byte where the NVDA,BMP provided by OpenFirmware is just the a=
ctive section.
>
>
>
> The patch is against the Adelie easy-kernel patch 5.4 tree, but it looks =
like that code is still there in the current upstream torvalds/linux git.


--_55DAD5ED-4B06-4189-BB8F-EE40A212A12B_
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html; charset="utf-8"

<html xmlns:o=3D"urn:schemas-microsoft-com:office:office" xmlns:w=3D"urn:sc=
hemas-microsoft-com:office:word" xmlns:m=3D"http://schemas.microsoft.com/of=
fice/2004/12/omml" xmlns=3D"http://www.w3.org/TR/REC-html40"><head><meta ht=
tp-equiv=3DContent-Type content=3D"text/html; charset=3Dutf-8"><meta name=
=3DGenerator content=3D"Microsoft Word 15 (filtered medium)"><style><!--
/* Font Definitions */
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0in;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:blue;
	text-decoration:underline;}
.MsoChpDefault
	{mso-style-type:export-only;}
@page WordSection1
	{size:8.5in 11.0in;
	margin:1.0in 1.0in 1.0in 1.0in;}
div.WordSection1
	{page:WordSection1;}
--></style></head><body lang=3DEN-US link=3Dblue vlink=3D"#954F72" style=3D=
'word-wrap:break-word'><div class=3DWordSection1><p class=3DMsoNormal>If it=
=E2=80=99s correct I=E2=80=99d like to see it make its way upstream. I have=
 no idea what the submission procedure is.</p><p class=3DMsoNormal><o:p>&nb=
sp;</o:p></p><div style=3D'mso-element:para-border-div;border:none;border-t=
op:solid #E1E1E1 1.0pt;padding:3.0pt 0in 0in 0in'><p class=3DMsoNormal styl=
e=3D'border:none;padding:0in'><b>From: </b><a href=3D"mailto:imirkin@alum.m=
it.edu">Ilia Mirkin</a><br><b>Sent: </b>Thursday, January 20, 2022 11:24 AM=
<br><b>To: </b><a href=3D"mailto:nick@glowingmonkey.org">Nick Lopez</a><br>=
<b>Cc: </b><a href=3D"mailto:nouveau@lists.freedesktop.org">nouveau@lists.f=
reedesktop.org</a><br><b>Subject: </b>Re: [Nouveau] Off-by-one or bad BIOS =
image? Apple eMac 800 GeForce 2MX</p></div><p class=3DMsoNormal><o:p>&nbsp;=
</o:p></p><p class=3DMsoNormal>This stuff is always so confusing. Let's thi=
nk this through.... if</p><p class=3DMsoNormal>bios size is 4, and we're tr=
ying to read a 4-byte thing starting at</p><p class=3DMsoNormal>address 0, =
that _ought_ to work, I think. So in my strawman case,</p><p class=3DMsoNor=
mal>bios-&gt;size =3D=3D 4, and size =3D=3D 4. So we should only error if s=
ize &gt;</p><p class=3DMsoNormal>bios-&gt;size, not if they're =3D=3D. Look=
s like your patch is right.</p><p class=3DMsoNormal><o:p>&nbsp;</o:p></p><p=
 class=3DMsoNormal>Want to make a linux kernel patch submission with this? =
(i.e.</p><p class=3DMsoNormal>including changelog, signoff, etc?)</p><p cla=
ss=3DMsoNormal><o:p>&nbsp;</o:p></p><p class=3DMsoNormal>Cheers,</p><p clas=
s=3DMsoNormal><o:p>&nbsp;</o:p></p><p class=3DMsoNormal>=C2=A0 -ilia</p><p =
class=3DMsoNormal><o:p>&nbsp;</o:p></p><p class=3DMsoNormal>On Thu, Jan 20,=
 2022 at 1:17 PM Nick Lopez &lt;nick@glowingmonkey.org&gt; wrote:</p><p cla=
ss=3DMsoNormal>&gt;<o:p>&nbsp;</o:p></p><p class=3DMsoNormal>&gt; Because I=
 watch too much retro YouTube I decided it was a good idea to try installin=
g Adelie Linux on my old G4/800 eMac, but the Live installer would freeze. =
By blacklisting nouveau I was able to get it booted and manually installed =
and, after hours and hours of compiling, get a working kernel tree to poke =
at. After only a few iterations with dump_stack() and nvkm_debug and the ou=
tput of envytools/nvbios I worked out at the last initscript instruction wa=
s stored in the last byte of the ROM. I think the bounds check in the nvbio=
s_addr() function is miscalculating the limit as one byte short, that=E2=80=
=99s why I was seeing this in the syslog:</p><p class=3DMsoNormal>&gt;<o:p>=
&nbsp;</o:p></p><p class=3DMsoNormal>&gt;<o:p>&nbsp;</o:p></p><p class=3DMs=
oNormal>&gt;<o:p>&nbsp;</o:p></p><p class=3DMsoNormal>&gt; nouveau 0000:00:=
10.0: bios: OOB 1 000007b2 000007b2</p><p class=3DMsoNormal>&gt;<o:p>&nbsp;=
</o:p></p><p class=3DMsoNormal>&gt; nouveau 0000:00:10.0: devinit: 0x000007=
b2[ ]: unknown opcode 0x00</p><p class=3DMsoNormal>&gt;<o:p>&nbsp;</o:p></p=
><p class=3DMsoNormal>&gt; nouveau 0000:00:10.0: preinit failed with -22</p=
><p class=3DMsoNormal>&gt;<o:p>&nbsp;</o:p></p><p class=3DMsoNormal>&gt; no=
uveau: DRM-master:00000000:00000080: init failed with -22</p><p class=3DMso=
Normal>&gt;<o:p>&nbsp;</o:p></p><p class=3DMsoNormal>&gt; nouveau 0000:00:1=
0.0: DRM-master: Device allocation failed: -22</p><p class=3DMsoNormal>&gt;=
<o:p>&nbsp;</o:p></p><p class=3DMsoNormal>&gt; nouveau: probe of 0000:00:10=
.0 failed with error -22</p><p class=3DMsoNormal>&gt;<o:p>&nbsp;</o:p></p><=
p class=3DMsoNormal>&gt;<o:p>&nbsp;</o:p></p><p class=3DMsoNormal>&gt;<o:p>=
&nbsp;</o:p></p><p class=3DMsoNormal>&gt; After I changed the limit check f=
rom:</p><p class=3DMsoNormal>&gt;<o:p>&nbsp;</o:p></p><p class=3DMsoNormal>=
&gt; if (unlikely(*addr + size &gt;=3D bios-&gt;size)) {</p><p class=3DMsoN=
ormal>&gt;<o:p>&nbsp;</o:p></p><p class=3DMsoNormal>&gt; to:</p><p class=3D=
MsoNormal>&gt;<o:p>&nbsp;</o:p></p><p class=3DMsoNormal>&gt; if (unlikely(*=
addr + size &gt; bios-&gt;size)) {</p><p class=3DMsoNormal>&gt;<o:p>&nbsp;<=
/o:p></p><p class=3DMsoNormal>&gt;<o:p>&nbsp;</o:p></p><p class=3DMsoNormal=
>&gt;<o:p>&nbsp;</o:p></p><p class=3DMsoNormal>&gt; it initialized the card=
 properly, brought up the fbconsole and even seems to be working in X with =
DRI. So the question is: was the bounds check wrong, or is the NVDA,BMP ima=
ge provided by OpenFirmware truncated? I=E2=80=99m guess this doesn=E2=80=
=99t turn up elsewhere because the ROM images read through any of the other=
 methods are the size of flash chip they=E2=80=99re stored on so there=E2=
=80=99s always unused space at the end and they never use the last byte whe=
re the NVDA,BMP provided by OpenFirmware is just the active section.</p><p =
class=3DMsoNormal>&gt;<o:p>&nbsp;</o:p></p><p class=3DMsoNormal>&gt;<o:p>&n=
bsp;</o:p></p><p class=3DMsoNormal>&gt;<o:p>&nbsp;</o:p></p><p class=3DMsoN=
ormal>&gt; The patch is against the Adelie easy-kernel patch 5.4 tree, but =
it looks like that code is still there in the current upstream torvalds/lin=
ux git.</p><p class=3DMsoNormal><o:p>&nbsp;</o:p></p></div></body></html>=

--_55DAD5ED-4B06-4189-BB8F-EE40A212A12B_--

