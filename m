Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 439FE33A86E
	for <lists+nouveau@lfdr.de>; Sun, 14 Mar 2021 23:04:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A5FE89DA5;
	Sun, 14 Mar 2021 22:04:31 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from w1.tutanota.de (w1.tutanota.de [81.3.6.162])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 077CC89F53
 for <nouveau@lists.freedesktop.org>; Sun, 14 Mar 2021 14:18:20 +0000 (UTC)
Received: from w3.tutanota.de (unknown [192.168.1.164])
 by w1.tutanota.de (Postfix) with ESMTP id 14F6BFBF4AB
 for <nouveau@lists.freedesktop.org>; Sun, 14 Mar 2021 14:18:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1615731497; 
 s=s1; d=tuta.io;
 h=From:From:To:To:Subject:Subject:Content-Description:Content-ID:Content-Type:Content-Type:Content-Transfer-Encoding:Content-Transfer-Encoding:Cc:Date:Date:In-Reply-To:MIME-Version:MIME-Version:Message-ID:Message-ID:Reply-To:References:Sender;
 bh=03e19+nitG08T5+f1gdXabhojmwf9dDDOjv/fLcbYCU=;
 b=sJ88lUEz1jLLKeNZblxKAJxyETIJoheNX/6eaVWkX7OOZkMmKx8cxRRFtsucu7EK
 5D1k8s4Wu+KBHgbWwzzNzumNfM5l89Wm3o9vUtYszte9PCbCrcawO+8QljXP+Mf9Y88
 nWPU3qd7CDrqYm2pmcACLLYjMRkASs17lAUTBanVzef4sQDcw+/tXw/A8vbp7gGtj6H
 LqxCEyWtWaFg2U1jjdZopWFHSW5shH9wxbENHy6fD+iI4SGGW7UmhQX+IhG4iBsrsOC
 AEqzVw2OIHl2snObBccsQ/G63SdnjIe9r4TWbft8G5Hc8j7HQJXprlPOUaV0tw4D5rY
 24KT94Fz3A==
Date: Sun, 14 Mar 2021 15:18:17 +0100 (CET)
From: stratus@tuta.io
To: Nouveau <nouveau@lists.freedesktop.org>
Message-ID: <MVl5Vra--3-2@tuta.io>
MIME-Version: 1.0
X-Mailman-Approved-At: Sun, 14 Mar 2021 22:04:30 +0000
Subject: [Nouveau] That dispnv50 patch blew up my laptop AGAIN as now it's
 in the LTS kernel
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

https://forum.artixlinux.org/index.php/topic,2083.msg14006.html#msg14006
https://forum.artixlinux.org/index.php/topic,2383.new.html#new

It is going to blow up many more now, the freeze bug may take days, weeks or months to appear, now with this patch on some hardware it will do nothing on others it will destroy the motherboard like I reported before.
_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
