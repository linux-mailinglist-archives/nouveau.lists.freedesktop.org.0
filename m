Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E6892E7890
	for <lists+nouveau@lfdr.de>; Wed, 30 Dec 2020 13:35:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8702389755;
	Wed, 30 Dec 2020 12:35:38 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
X-Greylist: delayed 1145 seconds by postgrey-1.36 at gabe;
 Wed, 30 Dec 2020 12:35:37 UTC
Received: from fallback4.mail.ox.ac.uk (fallback4.mail.ox.ac.uk [129.67.1.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C01889739
 for <nouveau@lists.freedesktop.org>; Wed, 30 Dec 2020 12:35:37 +0000 (UTC)
Received: from relay17.mail.ox.ac.uk ([129.67.1.165])
 by fallback4.mail.ox.ac.uk with esmtp (Exim 4.92)
 (envelope-from <law_ence.dev@ntlworld.com>) id 1kuaP2-0002br-JF
 for nouveau@lists.freedesktop.org; Wed, 30 Dec 2020 12:16:32 +0000
Received: from smtp8.mail.ox.ac.uk ([163.1.2.204])
 by relay17.mail.ox.ac.uk with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <law_ence.dev@ntlworld.com>)
 id 1kuaP1-0003Pa-3w
 for nouveau@lists.freedesktop.org; Wed, 30 Dec 2020 12:16:31 +0000
Received: from [88.98.86.50] (port=48054 helo=shelf.conquest)
 by smtp8.mail.ox.ac.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94)
 (envelope-from <law_ence.dev@ntlworld.com>) id 1kuaP0-0000RA-SG
 for nouveau@lists.freedesktop.org; Wed, 30 Dec 2020 12:16:30 +0000
Received: from ael by shelf.conquest with local (Exim 4.94)
 (envelope-from <ael@shelf.conquest>) id 1kuaOx-0003SL-Vb
 for nouveau@lists.freedesktop.org; Wed, 30 Dec 2020 12:16:27 +0000
Date: Wed, 30 Dec 2020 12:16:27 +0000
From: ael <law_ence.dev@ntlworld.com>
To: nouveau@lists.freedesktop.org
Message-ID: <X+xvmy/4jl4QgCEi@shelf.conquest>
References: <20200908002935.GD20064@merlins.org>
 <20200529180315.GA18804@merlins.org>
 <20201229155159.GG23389@merlins.org>
 <CAKb7UviFP_YVxC4PO7MDNnw6NDrD=3BCGF37umwAfaimjbX9Pw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAKb7UviFP_YVxC4PO7MDNnw6NDrD=3BCGF37umwAfaimjbX9Pw@mail.gmail.com>
X-Oxford-Username: oucs0041
Subject: Re: [Nouveau] 5.9.11 still hanging 2mn at each boot and looping on
 nvidia-gpu 0000:01:00.3: PME# enabled (Quadro RTX 4000 Mobile)
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

On Tue, Dec 29, 2020 at 11:33:16AM -0500, Ilia Mirkin wrote:
> On Tue, Dec 29, 2020 at 10:52 AM Marc MERLIN <marc_nouveau@merlins.org> wrote:
> 
> I'm not extremely familiar with debian packaging, but the firmware is
> provided by NVIDIA and shipped as part of linux-firmware:
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git/tree/nvidia

I think it may be  firmware-misc-nonfree.

ael
_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
