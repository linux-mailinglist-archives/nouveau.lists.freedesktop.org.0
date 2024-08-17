Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BBBCA95596D
	for <lists+nouveau@lfdr.de>; Sat, 17 Aug 2024 21:42:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B52510E0DB;
	Sat, 17 Aug 2024 19:42:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=meddatainc.com header.i=agents@meddatainc.com header.b="0RMRTq3l";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mout.perfora.net (mout.perfora.net [74.208.4.196])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5CDEF10E0DB
 for <nouveau@lists.freedesktop.org>; Sat, 17 Aug 2024 19:42:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=meddatainc.com;
 s=s1-ionos; t=1723923734; x=1724528534; i=agents@meddatainc.com;
 bh=GOlfTA/2BjjOtfPkiW3y/ce87etpr6JFnrSGSQE2Rn4=;
 h=X-UI-Sender-Class:Date:In-Reply-To:References:MIME-Version:
 Content-Type:Content-Transfer-Encoding:Subject:To:From:Message-ID:
 cc:content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=0RMRTq3lwfmvhypC0vTssdQy8wgfu3eVyQUz/tSDSjt94Nacii+MQXW2o39YiGyG
 Fb4azRQoL8uCOI+HjN4TFv1x5wHRoCHDw5bOFccI7+79laC97NENMTtjzRprlkk9c
 nNfwdXWoO3bqZ3LPn1ih7Inkqq6y6NGLGHl006pIAAZWSpU28XEb/vfeI7Wm/yEBV
 nEH6s78DZDDf0/G998AQM7HBdMuxygFfb9faO46Z/pgkdKaCnCeR18AKuMTuoT81Q
 YG5UeY8M/BAdDbXl2glIm/WpGDhty6hhxtXWQHwhVVn+iPSWNe3mCOTIE2tKEvhR6
 IxUQmYc5D1RIQFVFQg==
X-UI-Sender-Class: 55c96926-9e95-11ee-ae09-1f7a4046a0f6
Received: from [192.168.104.192] ([96.245.190.98]) by mrelay.perfora.net
 (mreueus003 [74.208.5.2]) with ESMTPSA (Nemesis) id 0M2sbo-1rq3LU0xBm-012jKs
 for <nouveau@lists.freedesktop.org>; Sat, 17 Aug 2024 21:42:14 +0200
Date: Sat, 17 Aug 2024 15:41:23 -0400
User-Agent: K-9 Mail for Android
In-Reply-To: <E2CB6BBD-35B1-4359-99F7-BBB0A6E6CA7A@meddatainc.com>
References: <E2CB6BBD-35B1-4359-99F7-BBB0A6E6CA7A@meddatainc.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Subject: Re: Possible nouveau driver problem?
To: nouveau@lists.freedesktop.org,
 Nouveau Mailing List <nouveau@lists.freedesktop.org>
From: H <agents@meddatainc.com>
Message-ID: <B2AE2FA5-1D8A-4359-B0D8-F5EC9828A2C9@meddatainc.com>
X-Provags-ID: V03:K1:wre1zYQ/b72ak9jLy2wYr42YmqxXAp30OJRxdApSnFuCCVaiylL
 halquiJKgpOLgMYE6oKbzY0GPQRmp2gjU/ScfsrEtVjsn2lfVIgkPcLpNpv1DZcxMmBi2Mq
 +yH3Zuq8bfQJM4gu+qvZ5pszadK0XY+esjQtkjvHlHC1YgmqjbFQ89LzWk5BNKBjM8ySW9c
 IwoFhWYcxCqPG2DVvb0jg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:Rp2jcaeRhu4=;YSAt33GDLZ/k8kwRLK35ZYlDCpl
 KA2vz/YjYUjAMw0jL5Wdj0lAFw5j3QtN5XMrbPuVFSov5fjeM8M0sGkcgh2TOFjsYfuJhPIPD
 YbnmOB7tkOtU9NN4gjDul4BLxmmGTSuHhvOAWelFicC4r3lPhUE89alGpS/cmuuPTd09AdShM
 C9qmSzwr77AD2UbEwF6lFz0VzSwwVbaXI7jKmSrJDm7bSZPHdY7dpETnJFi9nFjy3tiSmrsFn
 LHepUixR3B3yDidD1Q9EVX4cNDM9qbPtlzOLctzMjfaff3NTucnZEpbKRfYNJ4peQjrip8o1f
 REM0pNRUHx3+lcmhha/qPw/MARBsx0muy2sK+zYomqc7hKvli8sFt5RY9iam5swxEEdspSBqz
 o21My5iX2kHhCMs6bItoBGw1RjSm5lMccSMlfa79wJGrwMmcMCM0ej5M/insK3Zj8/ZqgYfXv
 9oneAgr3facCF/IrgtuRY3pGp/tIP4+qZLBJtvzZaRd4/Uj1h9VGU9KTwlBtjiIR6lkZnLkGQ
 PNSuoPVm8GHvZg0XQyMXU2Qk5f+sCF5707peiqMhnN2oXyz8y+zXUsJR1NPJhY9HJNtinYBrA
 5DKbaLYLbYpzhajeXZ07kOLp+LItCEnv/+vBDGv8LTnmjDeYyCtcJsVkp0TmpBxL7rTEuPuow
 xoyF6u3/vdmzsyP25DL9O3U36S/gK4KMzAMt3067HwBDsEs3CU457X43HCV2ZE8XIHlhC+Vg/
 DBqhhsknEgvoWzp68V8INFpEQ/cQTmHZw==
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

On August 15, 2024 8:24:26 PM GMT-04:00, H <agents@meddatainc=2Ecom> wrote:
>I am running Rocky Linux latest version with the Mate Desktop 1=2E26=2E2
>(the latest version in the EPEL repository) on a Dell Inspiron laptop
>with a 3840 x 2160 display and an external 1920 x 1080 Acer
>monitor connected via HDMI, see output below:
>
>$ inxi --graphics
>Graphics:
>  Device-1: Intel UHD Graphics 620 driver: i915 v: kernel
>  Device-2: NVIDIA GM108M [GeForce 940MX] driver: nouveau v: kernel
>Device-3: DisplayLink Dell D3100 Docking Station driver: usbfs type:
>USB
>  Device-4: Realtek Integrated_Webcam_HD driver: uvcvideo type: USB
>  Display: x11 server: X=2EOrg v: 1=2E20=2E11 driver: X: loaded: modesett=
ing
>    dri: iris gpu: i915 resolution: 1: 1920x1080~60Hz 2: 3840x2160~60Hz
>API: OpenGL v: 4=2E6 vendor: intel mesa v: 23=2E3=2E3 renderer: Mesa Inte=
l
>UHD
>    Graphics 620 (KBL GT2)
>
>The problem is that the external display has some issues, whether they
>are related to the nouveau driver, the Mate Desktop or something else I
>cannot determine=2E What happens is that although the
>external monitor is indeed using the 1920 x 1080 resolution and
>dragging a window from the laptop screen to the external screen works,
>ie=2E, it maintains the "correct" size, then maximizing it makes it
>1/4 of the size of the external monitor display=2E Likewise, the Mate
>Desktop background repeats partly 4-fold on this monitor, partly
>16-fold=2E=2E=2E
>
>I also have a Dell docking station, model D3100 and have downloaded the
>latest DisplayLink driver from github with the hope that I could attach
>two external Acer monitors to use with the laptop, I
>unable to use xrandr to correctly set the external monitor (I have only
>tried with one so far) to the desired 1920 x 1080 resolution while
>maintaining the 3840 x 2160 resolution on the laptop screen=2E
>
>Googling suggests that there might be some issues with xrandr and
>scaling
>
>Given my description above, could there possibly be a bug in the
>nouveau driver I am using?
>
>Thanks=2E =20

Would be great if someone could opine on the bug I am seeing : whether it =
might be a nouveau bug, xrandr-related bug or possibly Mate Desktop related=
 bug? Or some other bug=2E

Thank you=2E
