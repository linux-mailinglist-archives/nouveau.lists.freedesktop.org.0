Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 84992801E81
	for <lists+nouveau@lfdr.de>; Sat,  2 Dec 2023 21:33:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4548210E0A3;
	Sat,  2 Dec 2023 20:33:00 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
X-Greylist: delayed 907 seconds by postgrey-1.36 at gabe;
 Sat, 02 Dec 2023 20:32:57 UTC
Received: from sender4-pp-o90.zoho.com (sender4-pp-o90.zoho.com
 [136.143.188.90])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6FDDE10E0A3
 for <nouveau@lists.freedesktop.org>; Sat,  2 Dec 2023 20:32:48 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1701548258; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=mzjDFlg2tdzzWJwi0G7cOknGjKBArOwLFnAyIL4DO1uszfCvSbVHVZgZAeQJDlbAker5BA2AC57OFRHUQbroadXolMv3RH2rQJdCxcILlU2ps6eeMYMr6u42MAYrOVISovHKhVXbqNv40MZ133hYCgBRCmOVB+xWxVneH2NP2Bg=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1701548258;
 h=Content-Type:Content-Transfer-Encoding:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To:Cc;
 bh=ouOOaVR/Qb/imZG9eDcBfkaHgVYGKGLL1rzEvMnms4Q=; 
 b=UBDBBWn231rRamtSSJBznKGvHwCrpePql0G/KHwgA4SOwvO43AZM46UNaSYMWojbMN7noU7KEEgHX50kEwmMltCU6TvJpQV48a4lzFCvs5ovL+yur5WPT8M5mdZpdfzQC4QLfHcoHFlBLOHFX4jv9YPTgJkylNDxaVCnSEiJVS8=
ARC-Authentication-Results: i=1; mx.zohomail.com; dkim=pass  header.i=zoho.com;
 spf=pass  smtp.mailfrom=dufresnep@zoho.com;
 dmarc=pass header.from=<dufresnep@zoho.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1701548258; 
 s=zm2022; d=zoho.com; i=dufresnep@zoho.com;
 h=Date:Date:From:From:To:To:Message-ID:In-Reply-To:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Feedback-ID:Message-Id:Reply-To:Cc;
 bh=ouOOaVR/Qb/imZG9eDcBfkaHgVYGKGLL1rzEvMnms4Q=;
 b=Bahy27tKKGiaurv5eHzeiusGrjXIEXVTcAwsQqewEo/ef+6eFbVLsOS7dUDuAM8v
 QcUmTaErYZ75uDpyIvN6umU0HYHiHlES0hqmf7gvYmlNZHP7NEhYkGez1CRHIALmkFj
 cqvFMVm1Bz0xAsXPTbi4jwBsyrUOa6sQkymRo1rk=
Received: from mail.zoho.com by mx.zohomail.com
 with SMTP id 1701548253555694.5592242062087;
 Sat, 2 Dec 2023 12:17:33 -0800 (PST)
Received: from  [66.129.153.16] by mail.zoho.com
 with HTTP;Sat, 2 Dec 2023 12:17:33 -0800 (PST)
Date: Sat, 02 Dec 2023 15:17:33 -0500
From: Paul Dufresne <dufresnep@zoho.com>
To: "nouveau" <nouveau@lists.freedesktop.org>
Message-ID: <18c2c2de15d.455f53a281608.187456526925211202@zoho.com>
In-Reply-To: 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Importance: Medium
User-Agent: Zoho Mail
X-Mailer: Zoho Mail
Feedback-ID: rr080112287cb288a5e5448564ec2148840000e0f25dc0c9980817457449928c9029075b14a3342bc57b9ca3d3:zu080112279646cbef9efe566bccfbe8b7000036dc5f9f8f23626ad4ba7e999445a77cb55e3c7d2e58376ed4:rf0801123229084832884f33312f03f27700004b14927e02662159e9b779603c17f201b70424e46c14715a0d2d1b681d4376e74c60a79e:ZohoMail
Subject: [Nouveau] How to set debug parameters to get the information I want?
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

I now have something like:
GRUB_CMDLINE_LINUX="pcie_aspm=off nouveau.debug=\"info,PDISP=debug\""
in /etc/default/grub

in case you want to know why the pcie_aspm=off
it remove the AER corrected errors on PCIE device that my GTX 660 to generate

nouveau.debug=info
does not give me the information I want,
which is the state of the different engines with faulted 1 or faulted 0 after:
Apr 10 18:22:59 jenny kernel: nouveau 0000:02:00.0: fifo: SCHED_ERROR 0a [CTXSW_TIMEOUT]
to add more useful info in https://gitlab.freedesktop.org/xorg/driver/xf86-video-nouveau/-/issues/339 

nouveau.debug=debug
produce so much "crap" that when I "dmesg > somefile"
somefile does not have all messages from boot, because there is so much unneeded info, that only unneeded info is in the file.

unneeded info looks like this:
[  338.951804] nouveau: DRM-master:00000000:8000900b: fini completed in 7us
[  338.951811] nouveau: DRM-master:00000000:8000900b: destroy children...
[  338.951818] nouveau: DRM-master:00000000:8000900b: destroy running...
[  338.951825] nouveau: DRM-master:00000000:8000900b: destroy completed in 6us...
[  338.954303] nouveau: DRM-master:00000000:8000900b: init running...
[  338.954313] nouveau: DRM-master:00000000:8000900b: init children...
[  338.954319] nouveau: DRM-master:00000000:8000900b: init completed in 7us
[  338.954911] nouveau: DRM-master:00000000:8000900b: init running...

and appears too often, but less often:
[  339.029792] nouveau 0000:01:00.0: therm: FAN target request: 31%
[  339.029805] nouveau 0000:01:00.0: therm: FAN target: 31
[  339.029816] nouveau 0000:01:00.0: therm: FAN update: 31

I think, the DRM-master should not be at debug level, but on a more "paranoia" level.

Anyway, I need help to build a nouveau.debug= line that would make me achieve my goal... please!

