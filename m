Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BF705B535F
	for <lists+nouveau@lfdr.de>; Mon, 12 Sep 2022 07:21:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 031DE10E08E;
	Mon, 12 Sep 2022 05:20:58 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org
 [IPv6:2001:67c:2050:0:465::101])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BCBC110E08E
 for <nouveau@lists.freedesktop.org>; Mon, 12 Sep 2022 05:20:52 +0000 (UTC)
Received: from smtp102.mailbox.org (smtp102.mailbox.org
 [IPv6:2001:67c:2050:b231:465::102])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4MQw0x1z2dz9sQf
 for <nouveau@lists.freedesktop.org>; Mon, 12 Sep 2022 07:20:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=owenh.net; s=MBO0001; 
 t=1662960049;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=GxXLTN7vGVgXPZ/ARP4jzpEAh741PVkhd/k85qVVrzI=;
 b=EvgwIWPEc9AMG828C6dBPIeMk7WxNcxO3XmPOF9CUjQA/O7p8ufUZO6jYgVJAMXlvqtrFq
 CsWoXMsoD0IvaNGWgo+yK9u6MdNrpDjHOgliEm4PL43uOGFrOYcGJJEQjO2yGu0pQbp1e+
 CjVtN+MPB/xhZVnJFFMey3bZeEBQVZ8CnhbgIjTW1FtgWNlkcOu+6+iATvfZlEvZFgFpQx
 AD88nVGM9J8pVgRm6U4dKd2vFFfBxf9cf6FrT9z78qQzI2fMPGSlqeNnqEuNUz07oKzeWT
 ha+zJOfIUMGzV/mBW/tRNVhLNawJA8VUZxrdd1JyH5Ax+hNxqQInKPzmz7QnXQ==
Message-ID: <8497dcf1-2def-28db-f11d-2e24e041855b@owenh.net>
Date: Mon, 12 Sep 2022 00:20:44 -0500
MIME-Version: 1.0
Content-Language: en-US
To: nouveau@lists.freedesktop.org
From: "Owen T. Heisler" <writer@owenh.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 4MQw0x1z2dz9sQf
Subject: [Nouveau] Regression: Kernel/GPU crash with "Asynchronous wait on
 fence"
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

Hi,

I am experiencing a kernel/GPU crash once every few days on an Nvidia 
Optimus system with a secondary display connected to an Nvidia output. 
The secondary display turns off suddenly, X freezes, and in most cases 
the kernel hangs.

Module parameter `nouveau.config=NvClkMode=15` is in use, but I get the 
same behavior without it.

I have captured a variety of log data, but I find these two errors 
consistently:

- Asynchronous wait on fence nouveau:systemd-logind
- nouveau 0000:01:00.0: tmr: stalled at ffffffffffffffff
- Fixing recursive fault but reboot is needed!

This is a regression; nouveau was stable with Debian 10 buster (Linux 
v4.19). The crashes started after upgrading to Debian 11 bullseye. I 
have tested Linux v4.14.290, v4.19.255, and the latest nouveau-next 
commit 9622bcb7c72b230d64b7f7d2f9505e17214f3597; all exhibit the same 
behavior (with some variation in log output).

Is a userspace change causing a kernel crash? Do I need to try different 
versions of libdrm and xf86-video-nouveau userspace components?

I posted more information and log data at:
<https://gitlab.freedesktop.org/drm/nouveau/-/issues/180>

Thanks,
Owen
