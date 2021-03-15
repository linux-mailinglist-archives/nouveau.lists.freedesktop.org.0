Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AD78133AC36
	for <lists+nouveau@lfdr.de>; Mon, 15 Mar 2021 08:28:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1015489CD7;
	Mon, 15 Mar 2021 07:28:25 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 29A5389CDF;
 Mon, 15 Mar 2021 07:28:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=/4x/X3GS6thVGUK6cOVI8rH4h4+Oo61yBODFUT5MA0w=; b=vZi3bhH4d2YcxZIWoFyxnCOCzo
 hhpidY/A6Mbh0EWNvr0oyxoaxtFxeFowICoVqbo6OK+Fgs1EsPYDuqwvGPFnGYsbCBkIZSWYxCOcW
 53tvfYpwfVOOebLDQB//3YJkAXiY+BeQNlExtECW8bSXB9ZlaA8bahIuUUktyvMN0zXD25fma/ut9
 7Sa4bDI5j6qs0U6/ExHfBLXqx1JscAvFwgh3w63HrUrCUghFXuQgBKnC0iKP70Tx8EHYCGKSSEYj9
 KdWllX4zU5Vfypl+9TtxQCzfCvkQmhBD7U8ONPnT40VeCCb9W6OKibM/MKO7skATmiDfTlcrIEfFz
 B/grPu7A==;
Received: from hch by casper.infradead.org with local (Exim 4.94 #2 (Red Hat
 Linux)) id 1lLhdt-00HMIO-KN; Mon, 15 Mar 2021 07:27:58 +0000
Date: Mon, 15 Mar 2021 07:27:57 +0000
From: Christoph Hellwig <hch@infradead.org>
To: Alistair Popple <apopple@nvidia.com>
Message-ID: <20210315072757.GA4136862@infradead.org>
References: <20210312083851.15981-1-apopple@nvidia.com>
 <20210312083851.15981-2-apopple@nvidia.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210312083851.15981-2-apopple@nvidia.com>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 casper.infradead.org. See http://www.infradead.org/rpr.html
Subject: Re: [Nouveau] [PATCH v6 1/8] mm: Remove special swap entry functions
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

On Fri, Mar 12, 2021 at 07:38:44PM +1100, Alistair Popple wrote:
> Remove the migration and device private entry_to_page() and
> entry_to_pfn() inline functions and instead open code them directly.
> This results in shorter code which is easier to understand.

I think this commit log should mention pfn_swap_entry_to_page() now.

Otherwise looks good:

Reviewed-by: Christoph Hellwig <hch@lst.de>
_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
