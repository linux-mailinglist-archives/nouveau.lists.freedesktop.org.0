Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F2E6833AC39
	for <lists+nouveau@lfdr.de>; Mon, 15 Mar 2021 08:29:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B30189CF2;
	Mon, 15 Mar 2021 07:29:44 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 82AD989CF2;
 Mon, 15 Mar 2021 07:29:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=sAHht8ckTKMMHMl/tMIDmrJkSFI4s7y4ycAyn33KZeY=; b=TQR3921G8E2zC7YtRH4EsTOEWS
 8TbSrWIjqXG251q+SEQnIBor5JIW4K0UiYUTzyQcQRFeU9KeKN/1X9iygL1I/7MwxlczN09sEcHqt
 MZbjjlR/QzvqdTFS7QM6BSYJqtnqj7sPNMyvzjLGcNee2kXMXyuVmM/wQuksuqcC/BElTtzX6DHbT
 Jaw2bgjGEPwnKPIOtpa1sGEETbkD5w+FJZJC9LKIPHVMOCi7N+i2uOKF0iFq8COJhTZV1OnlKk1DT
 PVmNwonRdyPf9yXaVHlFrTWITod4RYjJV7DdfOz4fbBGHnZupO8G06mdUymQW+G6yGQ17WOtHbYrY
 VJYBi44g==;
Received: from hch by casper.infradead.org with local (Exim 4.94 #2 (Red Hat
 Linux)) id 1lLheq-00HMMy-8c; Mon, 15 Mar 2021 07:29:05 +0000
Date: Mon, 15 Mar 2021 07:28:56 +0000
From: Christoph Hellwig <hch@infradead.org>
To: Alistair Popple <apopple@nvidia.com>
Message-ID: <20210315072856.GB4136862@infradead.org>
References: <20210312083851.15981-1-apopple@nvidia.com>
 <20210312083851.15981-4-apopple@nvidia.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210312083851.15981-4-apopple@nvidia.com>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 casper.infradead.org. See http://www.infradead.org/rpr.html
Subject: Re: [Nouveau] [PATCH v6 3/8] mm/rmap: Split try_to_munlock from
 try_to_unmap
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
Cc: rcampbell@nvidia.com, willy@infradead.org, daniel@ffwll.ch,
 linux-doc@vger.kernel.org, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 kvm-ppc@vger.kernel.org, hch@infradead.org, linux-mm@kvack.org,
 bskeggs@redhat.com, jgg@nvidia.com, akpm@linux-foundation.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On Fri, Mar 12, 2021 at 07:38:46PM +1100, Alistair Popple wrote:
> The behaviour of try_to_unmap_one() is difficult to follow because it
> performs different operations based on a fairly large set of flags used
> in different combinations.
> 
> TTU_MUNLOCK is one such flag. However it is exclusively used by
> try_to_munlock() which specifies no other flags. Therefore rather than
> overload try_to_unmap_one() with unrelated behaviour split this out into
> it's own function and remove the flag.
> 
> Signed-off-by: Alistair Popple <apopple@nvidia.com>
> Reviewed-by: Ralph Campbell <rcampbell@nvidia.com>
> 
> ---
> 
> Christoph - I didn't add your Reviewed-by from v3 because removal of the
> extra VM_LOCKED check in v4 changed things slightly. Let me know if
> you're still ok for me to add it. Thanks.

Still looks good to me:

Reviewed-by: Christoph Hellwig <hch@lst.de>
_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
