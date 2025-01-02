Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B26DE9FF5A1
	for <lists+nouveau@lfdr.de>; Thu,  2 Jan 2025 03:57:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6224410E132;
	Thu,  2 Jan 2025 02:57:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=meddatainc.com header.i=agents@meddatainc.com header.b="FLWVAiC5";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
X-Greylist: delayed 302 seconds by postgrey-1.36 at gabe;
 Thu, 02 Jan 2025 02:57:07 UTC
Received: from mout.perfora.net (mout.perfora.net [74.208.4.196])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A763A10E132
 for <nouveau@lists.freedesktop.org>; Thu,  2 Jan 2025 02:57:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=meddatainc.com;
 s=s1-ionos; t=1735786626; x=1736391426; i=agents@meddatainc.com;
 bh=NvQ+rya4ESG/aYPRln/PVJxdCB0iBreIyshxFmUfWaM=;
 h=X-UI-Sender-Class:Date:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Subject:To:From:Message-ID:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=FLWVAiC5oE35aAtGUzp46DGfx5/kYHpewaxWVd7KWMECzK+/cHk6O1wN5rmlVKQo
 c6IQl7gofNg99wTquY4aplF9lTAkH1Osq/mutPXsAug30GWbCUg6VHm2pXf3Tv1j6
 VrIlKZtFOKO2oTpYtkRXmqDY2d5/yBJLRo3fFQOZqeYaJreaPXNxhME8zpGjQNcV2
 HrmN1qTSftwBT0ZI+Nqnpt0TsZBEEjirpteKaE+mVAwFxTTd28wfgwBvHkqn/5v7B
 DfH43xBQYJeqn3ZTueKdaYyXUoOA3JYs88NXiyxw+AhQIFnefzcIshZXXa5xgstoA
 5kXXMUxyixRLb1u/FQ==
X-UI-Sender-Class: 55c96926-9e95-11ee-ae09-1f7a4046a0f6
Received: from android-8f7cdbbc6da3bf42 ([71.162.171.44]) by
 mrelay.perfora.net (mreueus002 [74.208.5.2]) with ESMTPSA (Nemesis) id
 0LqSSV-1txY7J3VLN-00q4Z2 for <nouveau@lists.freedesktop.org>; Thu, 02 Jan
 2025 03:52:04 +0100
Date: Wed, 01 Jan 2025 21:51:30 -0500
User-Agent: K-9 Mail for Android
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Subject: Laptop, nouveau and external monitor
To: Nouveau Mailing List <nouveau@lists.freedesktop.org>
From: H <agents@meddatainc.com>
Message-ID: <02ED58A8-2A5D-4FF3-AC3A-AC14077F5F7F@meddatainc.com>
X-Provags-ID: V03:K1:DAR6lf6KgCb5qGrSr/aM4Snb61H/1GXB4HE84U93hxU+tl+iDAS
 Z4oinJcUdmtSWdFcLoQpeXPufy226zwwmjLgdiNxLDJH9Vaz/BQhaTPd16LINxJQhax0/iX
 x6whIDhRj7/Pr/NE6uwVKT4mhgEvGQjSDZdAt//jzHQTvNIx/2AqFujxykCkq4B8S/OaQ1K
 4tF58bCW+WkbZ+jolevQg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:oFURCjoM5Jc=;LqdmqUzPSf8BHiwV60C9RWKGoVf
 kjt9BA/lMtYnBoO/FLezrHOa3r/Gpgz/MUiRfnuQFAILGoitBoaOj69rj4RCOHbYqDREOwulM
 hWO33azpKUTfr3WMxBvt7x5IBGCvd3Mw4GW9DvWps5P0dX1g3ZfmTMrIolPY06a1nXua3ppwF
 Meee3lKKXP1G+tzBu2zXwo5shozqG5PbmHGveu5rVNnbhrFN7BAsBsI7zjbmaNKx4f1gtGTa/
 occCNz5l8EqmjPlmK28HWIDGQh74i3zAwYGl9NSIsWkhq99kDPMhV0xEutzkfPI4Gs/B0QBlo
 Vf3Ph0f9Bi4z+XCMYINo/QHsW8lhw5JwvO1rgvh1HQfkUZEqVYIuQdKSuEG6eN5m6q97VuuXl
 OgcFSRD2YHx3RH1hYgKdYUFbHuQkVcIYvPqXtlwRRBA/zwNi0M6wuSVVhUbWy9Wv0KbE3TkOn
 DGP0pkxSY4qNuO5ECmFEuSbzTzQk+APzYJvmJChtBAGMaHEmnyl8AFO4uXwqIkx0sof7dNdQs
 TSzhkPvmk1OQPoxkSnmdU4DuaRyx47i5P0cXG7qrK8uXxJ+znZg/2zb7SJ7earbdivxhz/ua7
 HkBcTsSW0kQxBWvkiGhbh7rqgmv2WJ0tCZ9JfjdMVBb/m7GEg2lkgaEpET+W5Tf0TbpatqcfI
 onYovYoHhLwk9srbgP6UpCVE7i5fZV+vFYLrF0yi1dP08M+HBlfYIIwFvvjiFI8+qIK1CFM5N
 1/FgRHJZ2po5lRCdu3yoj4BhnSdimacm/SI5G5VT69A3jA4QJ5jnUv4bgBEHwpTGKgM8rmaMb
 5qppcbUGBqU5BzhZg6q64ffo1+OznSXLsKjURvER3DynCXcrDiqtaZPgb4NlavsHnFWBIh/+7
 +TEtz4uWerfPYKGyf34ZcFGNF27/fHl0B/GRO4tl08euoWm04x6d4OE3vdXg4c00ATFNY/lfS
 IHOGfw0wf+oOfe1E4EBpPDi94GIqRGONhhk2idcZ68sGlTi6hHWlONBA4lfhSns7WQQSv7X+g
 lrXwP6qTWs/DEhHYy+cuM0MO5LXrF8mJVDcdAUT
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

Running the latest version of Rocky Linux 9 fully updated and Mate on a Del=
l Inspiron 7570 laptop with a UHD display, i=2Ee=2E 3840 x 2160 pixels=2E I=
 would like to attach two external monitors and initially experimented with=
 a Dell dock model 3100 and the latest version of the DisplayLink and evdi =
drivers=2E However, although the Mate display applet shows the correct reso=
lution for the laptop display itself and for the external monitor which is =
running at 1920 x 1080 pixels, the resolution on the second, external displ=
ay is more like 640 x 480 pixels=2E

While I initially thought this was due to a bug in the DisplayLink/evdi dr=
ivers, I see the same issue when I connect the monitor directly to the HDMI=
 output on the laptop itself, ie=2E DisplayLink/evdi are presumably not inv=
olved although they are installed, nor is the dock of course=2E

I just discovered running xrandr --listmonitors that, while the internal l=
aptop monitor is labeled eDP-1, xrandr identifies the external monitor as u=
sing DP-1 although it uses the laptop HDMI-connector=2E Further, while mate=
 hardware display monitor also identifies it as using DP-1 - possibly based=
 on xrandr output - the monitor itself tells me it is connected using its H=
DMI1 connector=2E xrandr does report the correct display resolution, though=
=2E

Thus, it looks like xrandr/nouveau misreads the configuration feeding it t=
o mate=2E I just updated the laptop BIOS to the very latest version and saw=
 no difference=2E

I am using an HDMI-HDMI cable with no adapters=2E I have tried both bootin=
g with the external monitor already attached and attaching/reattaching it l=
ater=2E The monitor is an Acer S230HL monitor=2E

I am using the nouveau driver and inxi reports the presence of both Intel =
UHD Graphics 620 and Nvidia GM108M (GeForce 940MX)=2E

The kernel is:
Linux 5=2E14=2E0-503=2E15=2E1=2Eel9_5=2Ex86_64 #1 SMP PREEMPT_DYNAMIC Tue =
Nov 26 17:24:29 UTC 2024 x86_64 x86_64 x86_64 GNU/Linux

Could this be an nouveau bug (I am running X11 and not Wayland)? How shoul=
d I troubleshoot it?

Appreciate ideas!
