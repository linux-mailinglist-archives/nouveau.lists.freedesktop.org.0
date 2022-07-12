Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A93195711A6
	for <lists+nouveau@lfdr.de>; Tue, 12 Jul 2022 07:01:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7DF7A10EF71;
	Tue, 12 Jul 2022 05:01:02 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2473B10EED0;
 Tue, 12 Jul 2022 05:01:01 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id 995B768AA6; Tue, 12 Jul 2022 07:00:55 +0200 (CEST)
Date: Tue, 12 Jul 2022 07:00:55 +0200
From: Christoph Hellwig <hch@lst.de>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
Message-ID: <20220712050055.GA4727@lst.de>
References: <20220711082614.GA29487@lst.de> <YsyItfiuccW7iQln@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YsyItfiuccW7iQln@intel.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
Subject: Re: [Nouveau] susetting the remaining swioltb couplin in DRM
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Jani Nikula <jani.nikula@linux.intel.com>, Ben Skeggs <bskeggs@redhat.com>,
 Christoph Hellwig <hch@lst.de>
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On Mon, Jul 11, 2022 at 04:31:49PM -0400, Rodrigo Vivi wrote:
> On Mon, Jul 11, 2022 at 10:26:14AM +0200, Christoph Hellwig wrote:
> > Hi i915 and nouveau maintainers,
> > 
> > any chance I could get some help to remove the remaining direct
> > driver calls into swiotlb, namely swiotlb_max_segment and
> > is_swiotlb_active.  Either should not matter to a driver as they
> > should be written to the DMA API.
> 
> Hi Christoph,
> 
> while we take a look here, could you please share the reasons
> behind sunsetting this calls?

Because they are a completely broken layering violation.  A driver has
absolutely no business knowing the dma-mapping violation.  The DMA
API reports what we think is all useful constraints (e.g.
dma_max_mapping_size()), and provides useful APIs to (e.g.
dma_alloc_noncoherent or dma_alloc_noncontiguous) to allocate pages
that can be mapped without bounce buffering and drivers should use
the proper API instead of poking into one particular implementation
and restrict it from changing.

swiotlb_max_segment in particular returns a value that isn't actually
correct (a driver can't just use all of swiotlb) AND actually doesn't
work as is in various scenarious that are becoming more common,
most notably host with memory encryption schemes that always require
bounce buffering.
