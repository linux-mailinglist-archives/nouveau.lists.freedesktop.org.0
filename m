Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F26656D831
	for <lists+nouveau@lfdr.de>; Mon, 11 Jul 2022 10:35:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A7438D0DA;
	Mon, 11 Jul 2022 08:35:37 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
X-Greylist: delayed 556 seconds by postgrey-1.36 at gabe;
 Mon, 11 Jul 2022 08:35:35 UTC
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E56C68D0D9
 for <nouveau@lists.freedesktop.org>; Mon, 11 Jul 2022 08:35:35 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id B022B68AA6; Mon, 11 Jul 2022 10:26:14 +0200 (CEST)
Date: Mon, 11 Jul 2022 10:26:14 +0200
From: Christoph Hellwig <hch@lst.de>
To: Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Ben Skeggs <bskeggs@redhat.com>, Karol Herbst <kherbst@redhat.com>,
 Lyude Paul <lyude@redhat.com>
Message-ID: <20220711082614.GA29487@lst.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.5.17 (2007-11-01)
Subject: [Nouveau] susetting the remaining swioltb couplin in DRM
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
Cc: nouveau@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

Hi i915 and nouveau maintainers,

any chance I could get some help to remove the remaining direct
driver calls into swiotlb, namely swiotlb_max_segment and
is_swiotlb_active.  Either should not matter to a driver as they
should be written to the DMA API.

In the i915 case it seems like the driver should use
dma_alloc_noncontiguous and/or dma_alloc_noncoherent to allocate
DMAable memory instead of using alloc_page and the streaming
dma mapping helpers.

For the latter it seems like it should just stop passing
use_dma_alloc == true to ttm_device_init and/or that function
should switch to use dma_alloc_noncoherent.
