Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8584A9A001B
	for <lists+nouveau@lfdr.de>; Wed, 16 Oct 2024 06:23:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4303D10E0A2;
	Wed, 16 Oct 2024 04:23:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.b="XMrPYYN4";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [198.137.202.133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9437410E0A2;
 Wed, 16 Oct 2024 04:23:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=wcUcuFqqucU0QfpmucbUVnYkn1DlkvM9RvqFMIVSmEk=; b=XMrPYYN4JlgEsNYp5enHSSCYqc
 slPqPTHsUImSqs9uZ8tuYyXhELrUaS6vuT2LbM8FULVnhDRDoPSOxRbLnKrqxJfsCvxchsxh/xfob
 0jxLgRHk9r1FX9mmer/+2Ucyl4c1oTrRKxbH/As2LplkV5Gjew/zJSSu5OFowW/Weiqt76vsqH2A9
 6MbrkgNsbFAn+Tporc1RfAb4/ILFpusmDuVBiN5pgm9X1RX+ynSMCRzo+Q+/AfUBZdZWUByjngnW2
 ei6oY5Aqp6vTzzCz6nfRU2O8SbkuURienIz9CqtuMQy7BprJJHjiy4/VtFMpLlLWkZstEG8ckU9I1
 o4iGa1WQ==;
Received: from hch by bombadil.infradead.org with local (Exim 4.98 #2 (Red Hat
 Linux)) id 1t0vZP-0000000ASzs-0jKN; Wed, 16 Oct 2024 04:23:35 +0000
Date: Tue, 15 Oct 2024 21:23:35 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Yonatan Maman <ymaman@nvidia.com>
Cc: nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-rdma@vger.kernel.org, linux-mm@kvack.org, herbst@redhat.com,
 lyude@redhat.com, dakr@redhat.com, airlied@gmail.com,
 simona@ffwll.ch, jgg@ziepe.ca, leon@kernel.org, jglisse@redhat.com,
 akpm@linux-foundation.org, dri-devel@lists.freedesktop.org,
 apopple@nvidia.com, bskeggs@nvidia.com
Subject: Re: [PATCH v1 0/4] GPU Direct RDMA (P2P DMA) for Device Private Pages
Message-ID: <Zw8_x0Tvux9IMbly@infradead.org>
References: <20241015152348.3055360-1-ymaman@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241015152348.3055360-1-ymaman@nvidia.com>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
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

On Tue, Oct 15, 2024 at 06:23:44PM +0300, Yonatan Maman wrote:
> From: Yonatan Maman <Ymaman@Nvidia.com>
> 
> This patch series aims to enable Peer-to-Peer (P2P) DMA access in
> GPU-centric applications that utilize RDMA and private device pages. This
> enhancement is crucial for minimizing data transfer overhead by allowing
> the GPU to directly expose device private page data to devices such as
> NICs, eliminating the need to traverse system RAM, which is the native
> method for exposing device private page data.

Please tone down your marketing language and explain your factual
changes.  If you make performance claims back them by numbers.

