Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CA609959EA8
	for <lists+nouveau@lfdr.de>; Wed, 21 Aug 2024 15:29:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D730410E60E;
	Wed, 21 Aug 2024 13:29:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=meddatainc.com header.i=agents@meddatainc.com header.b="NODc35Pm";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mout.perfora.net (mout.perfora.net [74.208.4.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D585510E60E
 for <nouveau@lists.freedesktop.org>; Wed, 21 Aug 2024 13:29:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=meddatainc.com;
 s=s1-ionos; t=1724246980; x=1724851780; i=agents@meddatainc.com;
 bh=cBDy0hsPZkQj345FtGZZaogMdBy/yQ01CJ4Ph7TbdRE=;
 h=X-UI-Sender-Class:Date:In-Reply-To:References:MIME-Version:
 Content-Type:Content-Transfer-Encoding:Subject:To:From:Message-ID:
 cc:content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=NODc35PmN3roL7pqgfJKV0Jj5p3qUOHgffPCGLz32r9XZXxZP4eNZSPLaifh+Cfx
 idwLvLCS/UeNGqJSll5oq2XQNWWEuXb+5XqJuOVoNgeciaLoxbS1lrezQBZtPLyi/
 l4PnyhKH362bmFWGFz141NRHNjKYp6l1f+U85tuSmHapMKN9H3LmtARRpC970+/WE
 1zivq+uYHpsWpKR+E0fu/YDPTXQ9FqwLZL6gTexSqH82OJRfv0IZ0gpIDtOm2MeLR
 FZu6SsdAHgetjyuCiPsSdE6t9dGLxvhsJvcHDEVdxurCCVqaLIwzLQLj8cJmDnzzH
 AkApVS7Hf7lEFns8bw==
X-UI-Sender-Class: 55c96926-9e95-11ee-ae09-1f7a4046a0f6
Received: from [192.168.1.215] ([71.162.171.44]) by mrelay.perfora.net
 (mreueus004 [74.208.5.2]) with ESMTPSA (Nemesis) id 1Mz9AN-1ruRsW3dgZ-00z5bp
 for <nouveau@lists.freedesktop.org>; Wed, 21 Aug 2024 15:29:40 +0200
Date: Wed, 21 Aug 2024 09:29:35 -0400
User-Agent: K-9 Mail for Android
In-Reply-To: <B2AE2FA5-1D8A-4359-B0D8-F5EC9828A2C9@meddatainc.com>
References: <E2CB6BBD-35B1-4359-99F7-BBB0A6E6CA7A@meddatainc.com>
 <B2AE2FA5-1D8A-4359-B0D8-F5EC9828A2C9@meddatainc.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Subject: Re: Possible nouveau driver problem?
To: nouveau@lists.freedesktop.org,
 Nouveau Mailing List <nouveau@lists.freedesktop.org>
From: H <agents@meddatainc.com>
Message-ID: <26AD7741-0AA8-4C79-89B8-57C206C634F1@meddatainc.com>
X-Provags-ID: V03:K1:KKxLqJwVF638UKoH5zcmLDi6+fb6zpoM+KaQ4ovPqum6XEeES5D
 BquS3Zzmeb6dxfEHg8UqkgUTbmer7BTZPXINFBeCUv3JRukRgXP7fk9ya4wy5emivFw7FH1
 GWb6V4jf7b/86ihlc/GWIVV6niUhhX/EaTdp6r8CsvTxi7lSHHY1v2D9gn9g9MPtSlpTNuf
 AbAQHnAiVna7KTbmQUvgQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:GWMWrKi/HG4=;EirA22Wx5R8BRZtTtl/yVrB1cZe
 EhUREkGI7kn/tjQqSybZyuF1jOQLz5SmOp38SCgCf1GpaKuF0UywwAUydPWfJnmCPVAARe0cU
 gBJIovoYbvSx/4OBZShMucqHuwZ2YcxTV+ZU5QJ1dZu5nnjUfXYU0BNrkt3zePeHETvOExzoo
 z+OoOMd9i8Zsyxt0+dPyN0g+dT56SdwMEiAvG8GXgyu+SCb/IzBjPw4GXdxHC4hpmJS9E6FSW
 06DKYGhMtvuuWv1dE/n5AIK2I16EPiL73bHmN/XG7Sro1QWQOg6cvvbsC6HeoDS62fg8O+nod
 ANE3ze4v7tHNIopxTRPx2zssLGzApBArfy1vev5KS4PHxv17qIJrEDmbIyteFXnzZ8nEJ9IbX
 JtiNT8q7nJzIYtZ5LEuf0lweuYZxSvAXKLzNHjmj/ZM28thFNeq9fOJN+aBPHxWXMM34xuOq1
 CJiMgA95eMXAuecdqodynGNmGNNwoO7HxtR8m7dNCC62Pj8RLQcpQbc0rcbv0iL96a36b7oqc
 UgMJ/0JsxpF7T2B41qiyyNIAgPkjfISlvJrUhdSlc7KAITWN8g8l0jBreCRLTI36dTNiOsn/j
 mrGg6Iy8mYPBUjKRAexBGjIeR/4R68OgbfyXbCJFjeDJGNUfLBRlD5+dezyOG1E1wYOJJnIOE
 VTgZJ05FumtdEhS4ODXSVgOjK8gE8Jh9jd+eu2iSXj9E2YKjka7dOl2KpmIfLEZXQwWPKYaMJ
 Un4bZ8pjR1i5BTKnEJcKsoKr7JmxtGigQ==
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

On August 17, 2024 3:41:23 PM EDT, H <agents@meddatainc=2Ecom> wrote:
>On August 15, 2024 8:24:26 PM GMT-04:00, H <agents@meddatainc=2Ecom>
>wrote:
>>I am running Rocky Linux latest version with the Mate Desktop 1=2E26=2E2
>>(the latest version in the EPEL repository) on a Dell Inspiron laptop
>>with a 3840 x 2160 display and an external 1920 x 1080 Acer
>>monitor connected via HDMI, see output below:
>>
>>$ inxi --graphics
>>Graphics:
>>  Device-1: Intel UHD Graphics 620 driver: i915 v: kernel
>>  Device-2: NVIDIA GM108M [GeForce 940MX] driver: nouveau v: kernel
>>Device-3: DisplayLink Dell D3100 Docking Station driver: usbfs type:
>>USB
>>  Device-4: Realtek Integrated_Webcam_HD driver: uvcvideo type: USB
>>  Display: x11 server: X=2EOrg v: 1=2E20=2E11 driver: X: loaded: modeset=
ting
>>    dri: iris gpu: i915 resolution: 1: 1920x1080~60Hz 2:
>3840x2160~60Hz
>>API: OpenGL v: 4=2E6 vendor: intel mesa v: 23=2E3=2E3 renderer: Mesa Int=
el
>>UHD
>>    Graphics 620 (KBL GT2)
>>
>>The problem is that the external display has some issues, whether they
>>are related to the nouveau driver, the Mate Desktop or something else
>I
>>cannot determine=2E What happens is that although the
>>external monitor is indeed using the 1920 x 1080 resolution and
>>dragging a window from the laptop screen to the external screen works,
>>ie=2E, it maintains the "correct" size, then maximizing it makes it
>>1/4 of the size of the external monitor display=2E Likewise, the Mate
>>Desktop background repeats partly 4-fold on this monitor, partly
>>16-fold=2E=2E=2E
>>
>>I also have a Dell docking station, model D3100 and have downloaded
>the
>>latest DisplayLink driver from github with the hope that I could
>attach
>>two external Acer monitors to use with the laptop, I
>>unable to use xrandr to correctly set the external monitor (I have
>only
>>tried with one so far) to the desired 1920 x 1080 resolution while
>>maintaining the 3840 x 2160 resolution on the laptop screen=2E
>>
>>Googling suggests that there might be some issues with xrandr and
>>scaling
>>
>>Given my description above, could there possibly be a bug in the
>>nouveau driver I am using?
>>
>>Thanks=2E =20
>
>Would be great if someone could opine on the bug I am seeing : whether
>it might be a nouveau bug, xrandr-related bug or possibly Mate Desktop
>related bug? Or some other bug=2E
>
>Thank you=2E

I have not seen anyone comment on my posting below=2E If this is not the a=
ppropriate forum to raise a potential bug, where should I raise it?
