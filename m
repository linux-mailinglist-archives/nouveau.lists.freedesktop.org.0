Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 40055809D06
	for <lists+nouveau@lfdr.de>; Fri,  8 Dec 2023 08:23:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 50C2210E9D9;
	Fri,  8 Dec 2023 07:23:20 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from sender4-pp-o90.zoho.com (sender4-pp-o90.zoho.com
 [136.143.188.90])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5247A10E9D9
 for <nouveau@lists.freedesktop.org>; Fri,  8 Dec 2023 07:23:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1702020197; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=RmnQbJsT0HJg5Ji2X6l2ZIP9b2JFUf6II/rpLK2zubBALwNykpp4j4WMFG1/hRXhm2aU1WzqqE0f9AMFv/yN3xhdcTW31Br+gIFN15KysXfAojh4dZvfL0lFDVxKWrifn6fx7h0Ylzmsxhfv44Ke3L/5gBvJgmBG/20P4eS0EIQ=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1702020197;
 h=Content-Type:Content-Transfer-Encoding:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To:Cc;
 bh=69u/obFqYQ0txPNr5c0ChfsmJT/Giqpx4aHjcidHWPM=; 
 b=YQmw1gAfHdqVBAwaB6OGJV3A0n31fnqZ2gavcVZl6xoX9Z0NpjtqfL9c3p3vaP+nbXM4puZJD7U/iS3Qz2z39GLBu6cv0ChzmX63jLtV06UOxJ7Pu26yXMpCWAOC3J4L9abWn0pBMEvNK+69fZBTUUXnXT+51Kjcq7dCspgLSos=
ARC-Authentication-Results: i=1; mx.zohomail.com; dkim=pass  header.i=zoho.com;
 spf=pass  smtp.mailfrom=dufresnep@zoho.com;
 dmarc=pass header.from=<dufresnep@zoho.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1702020197; 
 s=zm2022; d=zoho.com; i=dufresnep@zoho.com;
 h=Date:Date:From:From:To:To:Message-ID:In-Reply-To:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Feedback-ID:Message-Id:Reply-To:Cc;
 bh=69u/obFqYQ0txPNr5c0ChfsmJT/Giqpx4aHjcidHWPM=;
 b=ZajqfO51flKlO9rnXULA0SG6iAY7SIxazQqvKnW/wu7Tp1TBl9EEcF8tR5lek86c
 bDDgtbj8QWJH2AioIwf02Okh+TsI8LUhtGHoQAYwTD/JCYh4qNVjiVUwNcSmZxvwzoI
 02D9buejJ4bwfSD32Cvsh0o4ZWsu0aQAWL0mFVfk=
Received: from mail.zoho.com by mx.zohomail.com
 with SMTP id 1702020191124263.4457058642803;
 Thu, 7 Dec 2023 23:23:11 -0800 (PST)
Received: from  [66.129.153.16] by mail.zoho.com
 with HTTP;Thu, 7 Dec 2023 23:23:11 -0800 (PST)
Date: Fri, 08 Dec 2023 02:23:11 -0500
From: Paul Dufresne <dufresnep@zoho.com>
To: "nouveau" <nouveau@lists.freedesktop.org>
Message-ID: <18c484f1384.11597f7f962762.3209073694936907261@zoho.com>
In-Reply-To: 
Subject: fifo: SCHED_ERROR 0a [CTXSW_TIMEOUT]
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Importance: Medium
User-Agent: Zoho Mail
X-Mailer: Zoho Mail
Feedback-ID: rr0801122814aa8d556ab9aa9645e8290800009b6732db38bc25a9f248d3d605dd8fd5d3ff34a47226f088592d:zu08011227b2345434ae2263e8065288e500003339015d995b620d4570df1056b492544978cb940c1a19c66d:rf0801123294ea3642e673945ef85a9b910000b69e02f81c87a97ba96eaaa18fd93b220df2f51acbc4f995677495361dd9370623a1bfe3:ZohoMail
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

I begin to find a way that help me investigate fifo: SCHED_ERROR 0a [CTXSW_TIMEOUT] errors.
See https://gitlab.freedesktop.org/xorg/driver/xf86-video-nouveau/-/issues/339

I believe this affects mostly Fermi, Kepler and Maxwell1 graphic cards.

I'd like first to describe a bit how I proceed, then talk about separating this issue in many.

I am working on Gnome Debian Testing.
This environment react well (no freeze) when programs or XWayland are killed from the error.

I am using drm-misc, from: https://cgit.freedesktop.org/drm-misc/tree/
that I got with git clone git://cgit.freedesktop.org/drm-misc/tree/
and have compiled.

my kernel command line in /etc/grub/default have:
GRUB_CMDLINE_LINUX="pcie_aspm=off nouveau.debug=info nouveau.noaccel=0 drm.debug=0 log_buf_len=8M"
Not sure if only me need pcie_aspm=off to remove some AER errors on PCIe bus.

The first thing I do is:
su -
the - allows to have access to programs in /usr/sbin

dmesg --console-off
because I will generate a lot of messages, and I want them only in log files, not on console screen.

I launch Firefox, most of the bugs I get by browsing the web.

When ready to debug I do:
echo 255 > /sys/module/drm/parameters/debug

[At first was using 2, then 1 as suggested by /usr/sbin/modinfo drm, but then concluded 255 for all is the
 best to have all the cases that could cause the timeout]

I browse the web.

When Firefox stop, or everything goes away and return to the gdm (login screen), first thing I do is:
echo 0 > /sys/modules/drm/parameters/debug
to stop logging so much messages.

Then I do:
journalctl -b -g SCHED
to find at which second, the CTXSW_TIMEOUT message is.

Suppose it is at 08:21:14.
journalctl -b --since 08:21:13 --until 08:21:14
until the CTXSW_TIMEOUT is not the first line, I do it again with minus 1 sec on --since

Let's say I get up to: 08:21:09:
journalctl -b --since 08:21:09 --until 08:21:14 -o short-monotone > err.txt

cp err.txt /home/paul
mv /home/paul/err.txt /home/paul/journalctl_no1.txt
chown paul:paul /home/paul/journalctl_no1.txt

And then, as normal user paul:
gnome-text-editor journalctl_no1.txt &
and I search for: SCHED again...
and I looks the lines before to try to figure out the cause of the timeout.

If you take a look at: See https://gitlab.freedesktop.org/xorg/driver/xf86-video-nouveau/-/issues/339
you can see that what is before vary quite a bit each time.
I suspect there is many causes that can result in a MMU error on the GPU and so cause a timeout.

There is the possibility of a non-related memory corruption... I suppose.
But if not, it would make some sense to open a different issue for each different things happening before the timeout message.

Not sure, if is is really the good thing to do. So in part why I am writing this message to ask opinion(s).





