Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C60E80B502
	for <lists+nouveau@lfdr.de>; Sat,  9 Dec 2023 16:16:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9562610E15F;
	Sat,  9 Dec 2023 15:16:16 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from sender4-pp-o90.zoho.com (sender4-pp-o90.zoho.com
 [136.143.188.90])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C1B010E15F
 for <nouveau@lists.freedesktop.org>; Sat,  9 Dec 2023 15:16:14 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1702134971; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=KPAiKe1SP9TpEGT2QuXImB1Fefhy3cKbYnZ0kOZjJv0lGhxmbl6yTN4Ww1U5T3C3pV17GSmUZv8Br/eqNB48AFtMqyuEpf+rP6oZ0tv49dveC/xly4bLpHeK1R+w7M5n3wExI9lkz6a6J3daloMQZtLjCvFNhM0yGWnZLJ5cIcY=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1702134971;
 h=Content-Type:Content-Transfer-Encoding:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To:Cc;
 bh=LG4VKu04y6GwnKOYSBb/+9d2KxO8vRINGvrJEMKTUoE=; 
 b=dhDnI8xdiZd8M+4QvAquCK8OMQ2RW0hHXmTTAG9Y1h0yJG92CBlA8Dvwfm4smAmLuPiFkbP5Vd7GJ0PvQiStWVIPboPLf3pwKTlCrM6JhBURGHAJXWGeETGG4Qorsx4XvnPvxbH4Mb6Jb18WsTh9QpXBNP6aKj7AEy0jMGoDzr0=
ARC-Authentication-Results: i=1; mx.zohomail.com; dkim=pass  header.i=zoho.com;
 spf=pass  smtp.mailfrom=dufresnep@zoho.com;
 dmarc=pass header.from=<dufresnep@zoho.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1702134971; 
 s=zm2022; d=zoho.com; i=dufresnep@zoho.com;
 h=Date:Date:From:From:To:To:Message-ID:In-Reply-To:References:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Feedback-ID:Message-Id:Reply-To:Cc;
 bh=LG4VKu04y6GwnKOYSBb/+9d2KxO8vRINGvrJEMKTUoE=;
 b=PZJcXt9dICpwHQGqnho9riL88dCUCeZdLFn//DFAOM4fiNHWkbcLpFMtcQxWMjBA
 kqcLZofidVTIHptXA9m1gnhRB1swpb4m//xq2Bm2LEYrWt1wzUGOg993YpfA8MARjae
 DiATpICb1afWEeH4+Q+PUMTkVWaIZNT3wZQMwLbc=
Received: from mail.zoho.com by mx.zohomail.com
 with SMTP id 1702134964384433.3117820403917;
 Sat, 9 Dec 2023 07:16:04 -0800 (PST)
Received: from  [66.129.153.16] by mail.zoho.com
 with HTTP;Sat, 9 Dec 2023 07:16:04 -0800 (PST)
Date: Sat, 09 Dec 2023 10:16:04 -0500
From: Paul Dufresne <dufresnep@zoho.com>
To: "nouveau" <nouveau@lists.freedesktop.org>
Message-ID: <18c4f26608f.ff996d4011046.2126342314715462323@zoho.com>
In-Reply-To: <18c484f1384.11597f7f962762.3209073694936907261@zoho.com>
References: <18c484f1384.11597f7f962762.3209073694936907261@zoho.com>
Subject: =?UTF-8?Q?R=C3=A9=C2=A0:_fifo:_SCHED=5FERROR_0a_[CTXSW=5FTIMEOUT]?=
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Importance: Medium
User-Agent: Zoho Mail
X-Mailer: Zoho Mail
Feedback-ID: rr08011228544a8270287eee17bab4a30000008135cc679cbb1594a43f7b8c505b1d883bd37e03f1d5769c5bb4:zu080112271f2d87225325ef6538b8c93300002a1b5a2049e1bf72d41daf98471d6753881a7040c264e40f47:rf08011231961e27ebdf432672ef2b56ad0000421b4288e208182735f3f5c3dd263a001fe6d1dcf81a22a4687a3802825fe2aa1d7dc6:ZohoMail
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

I said:
 > When Firefox stop, or everything goes away and return to the gdm (login screen), first thing I do is: 
 > echo 0 > /sys/modules/drm/parameters/debug 
 > to stop logging so much messages. 
 >  
It is better to reboot using nouveau.noaccel=1 on the linux line when a bug arrive.
That way, the system is much more stable during investigation and report.

Is you cannot 'systemctl reboot', you might:
Alt-PrintScreen (a.k.a. Magic SysReq) s  to Synchronize
Alt-PrintScreen u to Unmount
Alt-PrintScreen b to reBoot

After reboot, use -b -1 on the command line rather than -b, to access previous boot session.
