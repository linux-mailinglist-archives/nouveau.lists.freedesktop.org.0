Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F7E6189602
	for <lists+nouveau@lfdr.de>; Wed, 18 Mar 2020 07:51:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 18EDF89A76;
	Wed, 18 Mar 2020 06:51:22 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F49989A76;
 Wed, 18 Mar 2020 06:51:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=HU3OpK2WrMDnYBFQ0mcXfjSZpfmRV36qu/4VljNG5ig=; b=UUXNx2bLZbq9R2xgMp9+ZXf/X4
 5Y+ZcxwA5J8Qu83bkUjfw6NDUo/6/Ee3tU+fekoobfS2QyzjaXVBj8QWHxwtVFruT9IJTVY3d/VAa
 TyrHpyWfCH2IpQqZOCOSO98nIjaGm9Mvx4p1pt4dHj3G742mLzfMeEGXUHGbR8n1bptovK2IXCRGE
 iYOSzb0xzMa2LFb6S0N4C7H3GWyk5G+gH/YNhpDN1xbjAvlSRYTgBvqgUTf8Aj/hajO3Jm4Fueu8e
 Lt4wQNZht/RT3UAH1cIoXhHVTHkFWmFXlOXBDJA0Vx6M2C85qYjQg8HMb3bfsyEimY+kNbe7CQ+3G
 JJ3JhzlA==;
Received: from hch by bombadil.infradead.org with local (Exim 4.92.3 #3 (Red
 Hat Linux)) id 1jESXv-00059Q-PA; Wed, 18 Mar 2020 06:51:19 +0000
Date: Tue, 17 Mar 2020 23:51:19 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Mikel Rychliski <mikel@mikelr.com>
Message-ID: <20200318065119.GA14425@infradead.org>
References: <20200313222258.15659-1-mikel@mikelr.com>
 <20200313222258.15659-3-mikel@mikelr.com>
 <20200317144731.GG23471@infradead.org>
 <49518530.5kixuQOrMm@glidewell>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <49518530.5kixuQOrMm@glidewell>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
Subject: Re: [Nouveau] [PATCH RESEND v2 2/2] PCI: Use ioremap(),
 not phys_to_virt() for platform ROM
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
Cc: "David \(ChunMing\) Zhou" <David1.Zhou@amd.com>, linux-pci@vger.kernel.org,
 Matthew Garrett <matthewgarrett@google.com>, amd-gfx@lists.freedesktop.org,
 Christoph Hellwig <hch@infradead.org>, Bjorn Helgaas <bhelgaas@google.com>,
 Ben Skeggs <bskeggs@redhat.com>, nouveau@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On Tue, Mar 17, 2020 at 09:34:33PM -0400, Mikel Rychliski wrote:
> I think the direct access to pdev->rom you suggest makes sense, especially 
> because users of the pci_platform_rom() are exposed to the fact that it just 
> calls ioremap().
> 
> I decided against wrapping the iounmap() with a pci_unmap_platform_rom(), but 
> I didn't apply the same consideration to the existing function.
> 
> How about something like this (with pci_platform_rom() removed)?

That looks sensible to me.
_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
