Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 422CC1F853F
	for <lists+nouveau@lfdr.de>; Sat, 13 Jun 2020 22:53:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B0C96E44A;
	Sat, 13 Jun 2020 20:53:55 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
X-Greylist: delayed 456 seconds by postgrey-1.36 at gabe;
 Mon, 18 May 2020 15:56:38 UTC
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 69D1E89E5B
 for <nouveau@lists.freedesktop.org>; Mon, 18 May 2020 15:56:38 +0000 (UTC)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
 by mail-out.m-online.net (Postfix) with ESMTP id 49Qk2j0MGZz1qs0w;
 Mon, 18 May 2020 17:49:00 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
 by mail.m-online.net (Postfix) with ESMTP id 49Qk2h6gJDz1qrLD;
 Mon, 18 May 2020 17:49:00 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
 by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
 port 10024)
 with ESMTP id ZKE-EipNsETh; Mon, 18 May 2020 17:49:00 +0200 (CEST)
X-Auth-Info: 2BPnDxd40dl7qpefxYzR1OV7DDlShqd1Jgz5S3KJldGN8DFbdG9mB8oA+Aw1SskX
Received: from igel.home (ppp-46-244-178-90.dynamic.mnet-online.de
 [46.244.178.90])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.mnet-online.de (Postfix) with ESMTPSA;
 Mon, 18 May 2020 17:49:00 +0200 (CEST)
Received: by igel.home (Postfix, from userid 1000)
 id AFBC72C01E5; Mon, 18 May 2020 17:48:59 +0200 (CEST)
From: Andreas Schwab <schwab@linux-m68k.org>
To: Ilia Mirkin <imirkin@alum.mit.edu>
References: <20200517220524.4036334-1-emil.l.velikov@gmail.com>
 <20200517220524.4036334-2-emil.l.velikov@gmail.com>
 <87d071aedu.fsf@mpe.ellerman.id.au> <87v9ktpd4v.fsf@igel.home>
 <CAKb7UvgBhvE-dEfva+n5SUTJ4CZT2KKkno=SVb9Jx5KBbZWR+A@mail.gmail.com>
X-Yow: I've got to get these SNACK CAKES to NEWARK by DAWN!!
Date: Mon, 18 May 2020 17:48:59 +0200
In-Reply-To: <CAKb7UvgBhvE-dEfva+n5SUTJ4CZT2KKkno=SVb9Jx5KBbZWR+A@mail.gmail.com>
 (Ilia Mirkin's message of "Mon, 18 May 2020 10:38:47 -0400")
Message-ID: <87blmlp7kk.fsf@igel.home>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.0.91 (gnu/linux)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="=-=-="
X-Mailman-Approved-At: Sat, 13 Jun 2020 20:53:54 +0000
Subject: Re: [Nouveau] [PATCH v2 2/2] powerpc/configs: replace deprecated
 riva/nvidia with nouveau
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
Cc: nouveau <nouveau@lists.freedesktop.org>,
 Emil Velikov <emil.l.velikov@gmail.com>
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

--=-=-=
Content-Type: text/plain

Here are the contents of
/proc/device-tree/pci\@0,f0000000/NVDA,Parent@10/NVDA,BMP:


--=-=-=
Content-Type: application/octet-stream
Content-Disposition: inline; filename="NVDA,BMP"
Content-Transfer-Encoding: base64

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
AFFQAAAAAAD/
--=-=-=
Content-Type: text/plain


Andreas.

-- 
Andreas Schwab, schwab@linux-m68k.org
GPG Key fingerprint = 7578 EB47 D4E5 4D69 2510  2552 DF73 E780 A9DA AEC1
"And now for something completely different."

--=-=-=
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau

--=-=-=--
