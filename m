Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C5972FC476
	for <lists+nouveau@lfdr.de>; Wed, 20 Jan 2021 00:09:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 19EB089E2A;
	Tue, 19 Jan 2021 23:09:41 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
X-Greylist: delayed 534 seconds by postgrey-1.36 at gabe;
 Tue, 19 Jan 2021 22:19:59 UTC
Received: from w1.tutanota.de (w1.tutanota.de [81.3.6.162])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 48C9B89CA0
 for <nouveau@lists.freedesktop.org>; Tue, 19 Jan 2021 22:19:59 +0000 (UTC)
Received: from w3.tutanota.de (unknown [192.168.1.164])
 by w1.tutanota.de (Postfix) with ESMTP id 43DADFBF62C
 for <nouveau@lists.freedesktop.org>; Tue, 19 Jan 2021 22:11:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1611094261; 
 s=s1; d=tuta.io;
 h=From:From:To:To:Subject:Subject:Content-Description:Content-ID:Content-Type:Content-Type:Content-Transfer-Encoding:Content-Transfer-Encoding:Cc:Date:Date:In-Reply-To:MIME-Version:MIME-Version:Message-ID:Message-ID:Reply-To:References:Sender;
 bh=/NcoljhU+5MzY6+KD0msIUPEKwISOOxbNSgytocmL9I=;
 b=Bcu9i+4UaVfxWKJco135EjeQ2HWW/AjATWT9/Dk7oBFsFR0/hwczoTztiyz3i1W9
 yr+gm62zAaWS2rI9Z7ZV2e0QeGgaNCUJysBZnDknMDbeiCVZ1ue6O3tjWT8u1RtjGRq
 bg17Pdn79tJswdMK7BWYx8SZ8DQqxgJOPHbAKH6Ft4iMcxKZsIN3+IvqbbTymxd/DPW
 Q5+7NZDwdvsZMh74Zcdz3sMbBjQI14UY2KMe9E+yffwhcaBuY5knnZ7vk9QcU9fzld2
 IU0EIvhGDfNxjvU4j52Lmd0PsvKj5ayx/UMkf8bfdgb+sW/E4Bdw1+NKtlyzdzKJQhM
 e4fNjlEAXg==
Date: Tue, 19 Jan 2021 23:11:01 +0100 (CET)
From: stratus@tuta.io
To: nouveau@lists.freedesktop.org
Message-ID: <MRRgoW3--3-2@tuta.io>
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 19 Jan 2021 23:09:40 +0000
Subject: [Nouveau] Unexpected result
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

BTW:
https://bugzilla.kernel.org/show_bug.cgi?id=210333
Best wishes, hopefully find something that works eventually.
_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
