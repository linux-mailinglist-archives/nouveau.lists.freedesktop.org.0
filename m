Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D695A72B845
	for <lists+nouveau@lfdr.de>; Mon, 12 Jun 2023 08:47:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 44D0010E164;
	Mon, 12 Jun 2023 06:47:46 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD57F10E164
 for <nouveau@lists.freedesktop.org>; Mon, 12 Jun 2023 06:47:43 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id C601568AFE; Mon, 12 Jun 2023 08:47:38 +0200 (CEST)
Date: Mon, 12 Jun 2023 08:47:38 +0200
From: Christoph Hellwig <hch@lst.de>
To: Juergen Gross <jgross@suse.com>
Message-ID: <20230612064738.GA19518@lst.de>
References: <20230518134253.909623-1-hch@lst.de>
 <20230518134253.909623-3-hch@lst.de> <ZGZr/xgbUmVqpOpN@mail-itl>
 <20230519040405.GA10818@lst.de> <ZGdLErBzi9MANL3i@mail-itl>
 <c5defff8-882e-3482-0de1-e50a4bcdfa99@suse.com>
 <20230607131257.GB19206@lst.de>
 <79b26dac-b507-1c05-b499-784ca6ee3db0@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <79b26dac-b507-1c05-b499-784ca6ee3db0@suse.com>
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
Cc: x86@kernel.org, Stefano Stabellini <sstabellini@kernel.org>,
 nouveau@lists.freedesktop.org, Dave Hansen <dave.hansen@linux.intel.com>,
 Marek =?iso-8859-1?Q?Marczykowski-G=F3recki?=
 <marmarek@invisiblethingslab.com>, linux-kernel@vger.kernel.org,
 iommu@lists.linux.dev, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Ben Skeggs <bskeggs@redhat.com>,
 "H. Peter Anvin" <hpa@zytor.com>, xen-devel@lists.xenproject.org,
 Thomas Gleixner <tglx@linutronix.de>, Christoph Hellwig <hch@lst.de>
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On Fri, Jun 09, 2023 at 05:38:28PM +0200, Juergen Gross wrote:
>>> guest started with e820_host=1 even if no PCI passthrough was planned.
>>> But this should be rather rare (at least I hope so).
>>
>> So is this an ACK for the patch and can we go ahead with it?
>
> As long as above mentioned check of the E820 map is done, yes.
>
> If you want I can send a diff to be folded into your patch on Monday.

Yes, that would be great!

