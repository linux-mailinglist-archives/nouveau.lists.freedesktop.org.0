Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D1482953E4C
	for <lists+nouveau@lfdr.de>; Fri, 16 Aug 2024 02:29:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0488D10E544;
	Fri, 16 Aug 2024 00:29:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=meddatainc.com header.i=agents@meddatainc.com header.b="1Gk/UMqE";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
X-Greylist: delayed 302 seconds by postgrey-1.36 at gabe;
 Fri, 16 Aug 2024 00:29:40 UTC
Received: from mout.perfora.net (mout.perfora.net [74.208.4.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3921610E544
 for <nouveau@lists.freedesktop.org>; Fri, 16 Aug 2024 00:29:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=meddatainc.com;
 s=s1-ionos; t=1723768179; x=1724372979; i=agents@meddatainc.com;
 bh=KR3DYghZZKkgQoF0tGNsPTolw7cWiOHYwwZRmpj21jw=;
 h=X-UI-Sender-Class:Date:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Subject:To:From:Message-ID:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=1Gk/UMqEDQXXgk8KRRDsNNCqnO5LRyC8zCwTfO9Yl31Dyk+UGyK4Dta6t4tiuYBs
 XoX+zsNfqLzI4u4NAez8ZOMm/3JemaEWoT2acN0CahvZBcNG5i6M6PuL8dPmtm8lX
 qtRGlpjQPFFT7l6DOPA8p1hocJe7D1pcwyksBrOTAsvaszLa3ztzR3ghHnjZXlXnT
 WHjyOmuWFA+s1eKr9S3G2SR2O4CIRDwPKW0HV3g90eGZGci7UpSn766p/hF6fQau3
 vSw8aS2Qcz4uVktbrMYQjdPtxl9xrMrcP8FiX0+oVkjk6z3RMK57P/wcNvx89i+Tu
 4rdPiq2aokPjJWHmIw==
X-UI-Sender-Class: 55c96926-9e95-11ee-ae09-1f7a4046a0f6
Received: from [192.168.104.192] ([96.245.190.98]) by mrelay.perfora.net
 (mreueus003 [74.208.5.2]) with ESMTPSA (Nemesis) id 0LjYVi-1s3D5x1DtA-00jOeV
 for <nouveau@lists.freedesktop.org>; Fri, 16 Aug 2024 02:24:37 +0200
Date: Thu, 15 Aug 2024 20:24:26 -0400
User-Agent: K-9 Mail for Android
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Subject: Possible nouveau driver problem?
To: Nouveau Mailing List <nouveau@lists.freedesktop.org>
From: H <agents@meddatainc.com>
Message-ID: <E2CB6BBD-35B1-4359-99F7-BBB0A6E6CA7A@meddatainc.com>
X-Provags-ID: V03:K1:mwlNA81Ng8vPh4qQwKR0yJ98rpuHKlrguxF1rGPCSPV/5Rxv9Ac
 we9UI1IPEJpIohSENfuJbrEwT/PoctJkkFFyVSGD1jz9lPdU3cFySyx/fqyu3OBQ6Eb+myg
 1gebNGxIfiUJO+8I0Fq2kTW+KkSYjAno4iXC7JdeeLwR2JwSGt/kZpbkgRBpE4PK1E/28eq
 Vp8xEzf5FxuSTnVy7EbeQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:ElFMWeoCvuA=;Cv7Ymajfww8XG6Ko/MZfx/a4hvW
 Z0y+5Bh1IDbikG9lWfi0gR2pzaC52XKVYqCgd0O7gbLHRb3hhvd5wBSpKFlZ40eXU7s7Yl0K6
 Fh+5TPGZErQVcUe7MC9X5G44vKAi+7KwdgBijiQXp+iqikJyiDQPaEOIK27IyE9eHxDcevXNT
 CYTFSQJH8YmXluzelkJ2+7r7d7WBliFqasbFECOfus9lEznkpBNHdCnCC9CqGX0WmcG1d0h3t
 YDLFeBtUGQ8XVh8YP5Y6ymcNJlJsdzciHyAmoHfuogozIsvPpNeE36bLBxX/hmRSkW9WkB0YH
 CwJ/Wxo5bt+3Rprkekx+SzB50DCJn9ZRFQQ1Xr9ECSziLO3wihRrZGgDKaP71y0gpEjKkzk7n
 //n7CaQ4RK0Yi0DIapEJ076zTYf49Ba7UiqcqYTn1pQqlLnjmpG8p31VSBIljyvWW4Rb7Ktdm
 +4Ow0MvD+nDrpf+TzJu8GKurTWLVl0oQznZrOX4XB8mtzAerFBGJVMazTxzWXG7hv5ofBPqMG
 TsrEE7Axfn0dy+tgH65gImZQ6a+GSoae+cWEx3PwV5h/LKAiKmRfY2qyZzEPHS1rPSd/tLrJr
 UwCXsDuig3BG73XM5+ZhpnoYmkgtZXDqFlG6qyKRs9KAQCXwtskVikjtrC6wC3nrEbuMcHnaY
 WB7ulqZZinAuluzsk6xfhm0hhYhu36ph7jFzVG8wmKpOjLETe5S7Nkk5Zsj2FCpHK/6UBo8ri
 yO2w9tjBrABIFhnllhhyYXU/9owGuqDyA==
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

I am running Rocky Linux latest version with the Mate Desktop 1=2E26=2E2 (t=
he latest version in the EPEL repository) on a Dell Inspiron laptop with a =
3840 x 2160 display and an external 1920 x 1080 Acer
monitor connected via HDMI, see output below:

$ inxi --graphics
Graphics:
  Device-1: Intel UHD Graphics 620 driver: i915 v: kernel
  Device-2: NVIDIA GM108M [GeForce 940MX] driver: nouveau v: kernel
  Device-3: DisplayLink Dell D3100 Docking Station driver: usbfs type: USB
  Device-4: Realtek Integrated_Webcam_HD driver: uvcvideo type: USB
  Display: x11 server: X=2EOrg v: 1=2E20=2E11 driver: X: loaded: modesetti=
ng
    dri: iris gpu: i915 resolution: 1: 1920x1080~60Hz 2: 3840x2160~60Hz
  API: OpenGL v: 4=2E6 vendor: intel mesa v: 23=2E3=2E3 renderer: Mesa Int=
el UHD
    Graphics 620 (KBL GT2)

The problem is that the external display has some issues, whether they are=
 related to the nouveau driver, the Mate Desktop or something else I cannot=
 determine=2E What happens is that although the
external monitor is indeed using the 1920 x 1080 resolution and dragging a=
 window from the laptop screen to the external screen works, ie=2E, it main=
tains the "correct" size, then maximizing it makes it
1/4 of the size of the external monitor display=2E Likewise, the Mate Desk=
top background repeats partly 4-fold on this monitor, partly 16-fold=2E=2E=
=2E

I also have a Dell docking station, model D3100 and have downloaded the la=
test DisplayLink driver from github with the hope that I could attach two e=
xternal Acer monitors to use with the laptop, I
unable to use xrandr to correctly set the external monitor (I have only tr=
ied with one so far) to the desired 1920 x 1080 resolution while maintainin=
g the 3840 x 2160 resolution on the laptop screen=2E

Googling suggests that there might be some issues with xrandr and scaling

Given my description above, could there possibly be a bug in the nouveau d=
river I am using?

Thanks=2E =20
