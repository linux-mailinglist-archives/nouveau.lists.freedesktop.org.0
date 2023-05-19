Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B519B709761
	for <lists+nouveau@lfdr.de>; Fri, 19 May 2023 14:41:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 736E410E0F2;
	Fri, 19 May 2023 12:41:25 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C8F8A10E0F2
 for <nouveau@lists.freedesktop.org>; Fri, 19 May 2023 12:41:23 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id A400368C7B; Fri, 19 May 2023 14:41:18 +0200 (CEST)
Date: Fri, 19 May 2023 14:41:18 +0200
From: Christoph Hellwig <hch@lst.de>
To: Marek =?iso-8859-1?Q?Marczykowski-G=F3recki?=
 <marmarek@invisiblethingslab.com>
Message-ID: <20230519124118.GA5869@lst.de>
References: <20230518134253.909623-1-hch@lst.de>
 <20230518134253.909623-3-hch@lst.de> <ZGZr/xgbUmVqpOpN@mail-itl>
 <20230519040405.GA10818@lst.de> <ZGdLErBzi9MANL3i@mail-itl>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZGdLErBzi9MANL3i@mail-itl>
User-Agent: Mutt/1.5.17 (2007-11-01)
Subject: Re: [Nouveau] [PATCH 2/4] x86: always initialize xen-swiotlb when
 xen-pcifront is enabling
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
Cc: Juergen Gross <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, nouveau@lists.freedesktop.org,
 Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
 linux-kernel@vger.kernel.org, iommu@lists.linux.dev,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 Ben Skeggs <bskeggs@redhat.com>, "H. Peter Anvin" <hpa@zytor.com>,
 xen-devel@lists.xenproject.org, Thomas Gleixner <tglx@linutronix.de>,
 Christoph Hellwig <hch@lst.de>
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On Fri, May 19, 2023 at 12:10:26PM +0200, Marek Marczykowski-Górecki wrote:
> While I would say PCI passthrough is not very common for PV guests, can
> the decision about xen-swiotlb be delayed until you can enumerate
> xenstore to check if there are any PCI devices connected (and not
> allocate xen-swiotlb by default if there are none)? This would
> still not cover the hotplug case (in which case, you'd need to force it
> with a cmdline), but at least you wouldn't loose much memory just
> because one of your VMs may use PCI passthrough (so, you have it enabled
> in your kernel).

How early can we query xenstore?  We'd need to do this before setting
up DMA for any device.

The alternative would be to finally merge swiotlb-xen into swiotlb, in
which case we might be able to do this later.  Let me see what I can
do there.
