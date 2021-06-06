Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DDF739D190
	for <lists+nouveau@lfdr.de>; Sun,  6 Jun 2021 23:16:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A6EA06E087;
	Sun,  6 Jun 2021 21:16:08 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from hosting.gsystem.sk (hosting.gsystem.sk [212.5.213.30])
 by gabe.freedesktop.org (Postfix) with ESMTP id D4F0C6E087;
 Sun,  6 Jun 2021 21:16:07 +0000 (UTC)
Received: from [192.168.0.2] (unknown [188.167.68.178])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by hosting.gsystem.sk (Postfix) with ESMTPSA id E3DBC7A021C;
 Sun,  6 Jun 2021 23:16:05 +0200 (CEST)
From: Ondrej Zary <linux@zary.sk>
To: Ben Skeggs <bskeggs@redhat.com>
Date: Sun, 6 Jun 2021 23:16:03 +0200
User-Agent: KMail/1.9.10
References: <202106052143.52488.linux@zary.sk>
 <202106052334.23943.linux@zary.sk>
In-Reply-To: <202106052334.23943.linux@zary.sk>
X-KMail-QuotePrefix: > 
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <202106062316.03369.linux@zary.sk>
Subject: Re: [Nouveau] nouveau broken on Riva TNT2 in 5.13.0-rc4: NULL
 pointer dereference in nouveau_bo_sync_for_device
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
Cc: nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On Saturday 05 June 2021 23:34:23 Ondrej Zary wrote:
> On Saturday 05 June 2021 21:43:52 Ondrej Zary wrote:
> > Hello,
> > I'm testing 5.13.0-rc4 and nouveau crashes with NULL pointer dereference in nouveau_bo_sync_for_device.
> > Found various reports like this but that was back in februaryso that should be fixed now.
> 
> So it is the same bug. Broken since 5.11. This revert fixes it in 5.11:
> https://lists.freedesktop.org/archives/dri-devel/2021-February/298531.html
> 
> Added some debug printks to nouveau_bo_sync_for_device:
> [   22.225048] ttm_dma=fc33b500
> [   22.225066] ttm_dma->num_pages=18
> [   22.225071] i=0 num_pages=16
> [   22.225077] ttm_dma->dma_address=00000000
> [   22.225094] BUG: kernel NULL pointer dereference, address: 00000000
> 
> So ttm->dma_address is NULL.
> 

Tested reverting f295c8cfec833c2707ff1512da10d65386dde7af again and it does not work...
Not sure what I did before.

Bisecting between 5.10 and 5.11 is impossible - I keep hitting neverending stream of bugs.
As always with nouveau...

-- 
Ondrej Zary
_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
