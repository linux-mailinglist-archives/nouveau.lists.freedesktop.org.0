Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 15F7A8025A9
	for <lists+nouveau@lfdr.de>; Sun,  3 Dec 2023 17:51:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4739D10E2A4;
	Sun,  3 Dec 2023 16:51:56 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from sender4-pp-o90.zoho.com (sender4-pp-o90.zoho.com
 [136.143.188.90])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A62B910E2A4
 for <nouveau@lists.freedesktop.org>; Sun,  3 Dec 2023 16:51:53 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1701622311; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=hWNWKKuRGOZ2GNeCmySNwUuIrshB0g0bsohQ9bo3N1e54Jwomu6BNbTQPY+meZFK5lTB9N9TfvWLZEHItEborog87+LgPV8i2Cf5BxeMjLeZKQPtQEunpw8Hxoy5HgFpyGS1TtRkLIzhtECCcMkuwlEDdTOqPPhNkNlGeU8z6RA=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1701622311;
 h=Content-Type:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To:Cc;
 bh=+Nw+vnLUvF+DajApC1Uv0eFgPt0IGBm/6BuG5J5LSR4=; 
 b=Xu8nFxISui2R9I0Itbhwt98EeHoE9FZCesEDFXfGif0VVx3wOi0qBoPzniipdob4kjbWvDMgnWfdHBZ6K21RTv6auir+dYFSypm6WzDfgCd/Ngix1I/8pIA2LohQukQD0DlNtuYMnserBMa5jFllREChU3ZOPr4eFNRT2gPaU6A=
ARC-Authentication-Results: i=1; mx.zohomail.com; dkim=pass  header.i=zoho.com;
 spf=pass  smtp.mailfrom=dufresnep@zoho.com;
 dmarc=pass header.from=<dufresnep@zoho.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1701622311; 
 s=zm2022; d=zoho.com; i=dufresnep@zoho.com;
 h=Date:Date:From:From:To:To:Message-Id:Message-Id:In-Reply-To:Subject:Subject:MIME-Version:Content-Type:Feedback-ID:Reply-To:Cc;
 bh=+Nw+vnLUvF+DajApC1Uv0eFgPt0IGBm/6BuG5J5LSR4=;
 b=Yj1rDEyRJ0JOPwvaDB1mDH0A2tyzJ+fIHJ7dQSwgDhuaWbb1gwQDHRgv8EO1+ulq
 5EHhueuUPAnHQjLGOOIdARDW5VJyfXN8kV0gikXqXEaPgzHDTxOkdygN33fD4u7IdF7
 Ah2H5C4I5xnfrJ4n5c+3UcazWZ1KnNMGKt10vwaQ=
Received: from mail.zoho.com by mx.zohomail.com
 with SMTP id 1701622305113580.2214701951027;
 Sun, 3 Dec 2023 08:51:45 -0800 (PST)
Received: from  [66.129.153.16] by mail.zoho.com
 with HTTP;Sun, 3 Dec 2023 08:51:45 -0800 (PST)
Date: Sun, 03 Dec 2023 11:51:45 -0500
From: Paul Dufresne <dufresnep@zoho.com>
To: "nouveau" <nouveau@lists.freedesktop.org>
Message-Id: <18c3097d144.f5b40a2d3930.7461400275770948859@zoho.com>
In-Reply-To: 
MIME-Version: 1.0
Content-Type: multipart/alternative; 
 boundary="----=_Part_10163_773292255.1701622305092"
Importance: Medium
User-Agent: Zoho Mail
X-Mailer: Zoho Mail
Feedback-ID: rr080112284f724fc33bc53ab4cb3d2c1400008a161cc237ed37a2bb0324bd35626e14a01e1cbd8c843f113e46:zu0801122787502089b890672248a8d15c0000361b6e9f133af681646a3ecefb780a6567aa0660e80f708a26:rf08011232ef9a02ddc135917d81d5781f00007e9c0da7f02909371733bf9c37c49ba33f975ec01b08a6da2163d81fdbcf93e829d38a8b:ZohoMail
Subject: [Nouveau] nouveau-next stalled to august 30?
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

------=_Part_10163_773292255.1701622305092
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

According to:

https://nouveau.freedesktop.org/InstallNouveau.html

the project use the kernel at:

https://gitlab.freedesktop.org/drm/nouveau

but history shows that it stalled at August 30:

https://gitlab.freedesktop.org/drm/nouveau/-/commits/nouveau-next

because of this patch that cannot be push:

https://gitlab.freedesktop.org/drm/nouveau/-/commit/775b8212e839213b335594cd5cef084d6a88a3af/pipelines?ref=nouveau-next



So... I just don't understand where all the patches on this mailing list goes into which repository.



BTW: https://nouveau.freedesktop.org/ shows in Software section to use:

https://github.com/skeggsb/linux/

but this seems to be 8 years behind.
------=_Part_10163_773292255.1701622305092
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"><html><head>=
<meta content=3D"text/html;charset=3DUTF-8" http-equiv=3D"Content-Type"></h=
ead><body ><div style=3D"font-family: Verdana, Arial, Helvetica, sans-serif=
; font-size: 10pt;"><div>According to:<br></div><div><a target=3D"_blank" h=
ref=3D"https://nouveau.freedesktop.org/InstallNouveau.html">https://nouveau=
.freedesktop.org/InstallNouveau.html</a><br></div><div>the project use the =
kernel at:<br></div><div><a target=3D"_blank" href=3D"https://gitlab.freede=
sktop.org/drm/nouveau">https://gitlab.freedesktop.org/drm/nouveau</a><br></=
div><div>but history shows that it stalled at August 30:<br></div><div><a t=
arget=3D"_blank" href=3D"https://gitlab.freedesktop.org/drm/nouveau/-/commi=
ts/nouveau-next">https://gitlab.freedesktop.org/drm/nouveau/-/commits/nouve=
au-next</a><br></div><div>because of this patch that cannot be push:<br></d=
iv><div><a target=3D"_blank" href=3D"https://gitlab.freedesktop.org/drm/nou=
veau/-/commit/775b8212e839213b335594cd5cef084d6a88a3af/pipelines?ref=3Dnouv=
eau-next">https://gitlab.freedesktop.org/drm/nouveau/-/commit/775b8212e8392=
13b335594cd5cef084d6a88a3af/pipelines?ref=3Dnouveau-next</a><br></div><div>=
<br></div><div>So... I just don't understand where all the patches on this =
mailing list goes into which repository.<br></div><div><br></div><div>BTW: =
<a target=3D"_blank" href=3D"https://nouveau.freedesktop.org/">https://nouv=
eau.freedesktop.org/</a> shows in Software section to use:<br></div><div><a=
 target=3D"_blank" href=3D"https://github.com/skeggsb/linux/">https://githu=
b.com/skeggsb/linux/</a><br></div><div>but this seems to be 8 years behind.=
<br></div></div><br></body></html>
------=_Part_10163_773292255.1701622305092--

