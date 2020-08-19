Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DD61249CA1
	for <lists+nouveau@lfdr.de>; Wed, 19 Aug 2020 13:52:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D389D6E2B6;
	Wed, 19 Aug 2020 11:52:21 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 66D446E19C
 for <nouveau@lists.freedesktop.org>; Wed, 19 Aug 2020 06:56:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:In-Reply-To:References;
 bh=z2KvWaZyjho7ndXMH0ORSIBGMLsoLoOlaFmWAQTQuew=; b=uRThKpBVD38wHW4O1Rw+m7ReIB
 6g8DAFjC8rOV8slo1/sXfbFmSe2ZQ/D8oXBbMOULOMMqWf/LF2YgmRNBRhy6xw/WNcPfIgir5jkfY
 jMUBZNOtuPrAml+wEbfI5OBf4FZwNLx4AJ6KLMbazwwdxWKTRuJ8t4QvNBD00a4zi7/l8eeZNVCHo
 TVip/vAV16StqtD9sSi3vWzGnecdc/pw7stv6o2Z7fnoWC5+a2JoL1fYWc4VJinapBZy26rlLUcYn
 mtr0U1RQYeE7P0ovTcYzaF9TaQqsHNEEbAFwOJIquRs9u5qnSydzfDIu7+tbwzSbcDpvLkPbTkcNu
 ySmmqGNA==;
Received: from [2001:4bb8:198:f3b2:86b6:2277:f429:37a1] (helo=localhost)
 by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k8I0q-0008Kr-1o; Wed, 19 Aug 2020 06:55:57 +0000
From: Christoph Hellwig <hch@lst.de>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 Joonyoung Shim <jy0922.shim@samsung.com>,
 Seung-Woo Kim <sw0312.kim@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>, Ben Skeggs <bskeggs@redhat.com>,
 Pawel Osciak <pawel@osciak.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Matt Porter <mporter@kernel.crashing.org>, iommu@lists.linux-foundation.org
Date: Wed, 19 Aug 2020 08:55:27 +0200
Message-Id: <20200819065555.1802761-1-hch@lst.de>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 casper.infradead.org. See http://www.infradead.org/rpr.html
X-Mailman-Approved-At: Wed, 19 Aug 2020 11:52:18 +0000
Subject: [Nouveau] a saner API for allocating DMA addressable pages
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
Cc: Tom Lendacky <thomas.lendacky@amd.com>, alsa-devel@alsa-project.org,
 linux-samsung-soc@vger.kernel.org, linux-ia64@vger.kernel.org,
 linux-scsi@vger.kernel.org, linux-parisc@vger.kernel.org,
 linux-doc@vger.kernel.org, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-nvme@lists.infradead.org,
 linux-mips@vger.kernel.org, linux-mm@kvack.org, netdev@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

Hi all,

this series replaced the DMA_ATTR_NON_CONSISTENT flag to dma_alloc_attrs
with a separate new dma_alloc_pages API, which is available on all
platforms.  In addition to cleaning up the convoluted code path, this
ensures that other drivers that have asked for better support for
non-coherent DMA to pages with incurring bounce buffering over can finally
be properly supported.

I'm still a little unsure about the API naming, as alloc_pages sort of
implies a struct page return value, but we return a kernel virtual
address.  The other alternative would be to name the API
dma_alloc_noncoherent, but the whole non-coherent naming seems to put
people off.  As a follow up I plan to move the implementation of the
DMA_ATTR_NO_KERNEL_MAPPING flag over to this framework as well, given
that is also is a fundamentally non coherent allocation.  The replacement
for that flag would then return a struct page, as it is allowed to
actually return pages without a kernel mapping as the name suggested
(although most of the time they will actually have a kernel mapping..)

In addition to the conversions of the existing non-coherent DMA users
the last three patches also convert the DMA coherent allocations in
the NVMe driver to use this new framework through a dmapool addition.
This was both to give me a good testing vehicle, but also because it
should speed up the NVMe driver on platforms with non-coherent DMA
nicely, without a downside on platforms with cache coherent DMA.


A git tree is available here:

    git://git.infradead.org/users/hch/misc.git dma_alloc_pages

Gitweb:

    http://git.infradead.org/users/hch/misc.git/shortlog/refs/heads/dma_alloc_pages


Diffstat:
 Documentation/core-api/dma-api.rst                       |   92 ++----
 Documentation/core-api/dma-attributes.rst                |    8 
 Documentation/userspace-api/media/v4l/buffer.rst         |   17 -
 Documentation/userspace-api/media/v4l/vidioc-reqbufs.rst |    1 
 arch/alpha/kernel/pci_iommu.c                            |    2 
 arch/arm/include/asm/dma-direct.h                        |    4 
 arch/arm/mm/dma-mapping-nommu.c                          |    2 
 arch/arm/mm/dma-mapping.c                                |    4 
 arch/ia64/Kconfig                                        |    3 
 arch/ia64/hp/common/sba_iommu.c                          |    2 
 arch/ia64/kernel/dma-mapping.c                           |   14 
 arch/ia64/mm/init.c                                      |    3 
 arch/mips/Kconfig                                        |    1 
 arch/mips/bmips/dma.c                                    |    4 
 arch/mips/cavium-octeon/dma-octeon.c                     |    4 
 arch/mips/include/asm/dma-direct.h                       |    4 
 arch/mips/include/asm/jazzdma.h                          |    2 
 arch/mips/jazz/jazzdma.c                                 |  102 +------
 arch/mips/loongson2ef/fuloong-2e/dma.c                   |    4 
 arch/mips/loongson2ef/lemote-2f/dma.c                    |    4 
 arch/mips/loongson64/dma.c                               |    4 
 arch/mips/mm/dma-noncoherent.c                           |   48 +--
 arch/mips/pci/pci-ar2315.c                               |    4 
 arch/mips/pci/pci-xtalk-bridge.c                         |    4 
 arch/mips/sgi-ip32/ip32-dma.c                            |    4 
 arch/parisc/Kconfig                                      |    1 
 arch/parisc/kernel/pci-dma.c                             |    6 
 arch/powerpc/include/asm/dma-direct.h                    |    4 
 arch/powerpc/kernel/dma-iommu.c                          |    2 
 arch/powerpc/platforms/ps3/system-bus.c                  |    4 
 arch/powerpc/platforms/pseries/vio.c                     |    2 
 arch/s390/pci/pci_dma.c                                  |    2 
 arch/x86/kernel/amd_gart_64.c                            |    8 
 drivers/gpu/drm/exynos/exynos_drm_gem.c                  |    2 
 drivers/gpu/drm/nouveau/nvkm/subdev/instmem/gk20a.c      |    3 
 drivers/iommu/dma-iommu.c                                |    2 
 drivers/iommu/intel/iommu.c                              |    6 
 drivers/media/common/videobuf2/videobuf2-core.c          |   36 --
 drivers/media/common/videobuf2/videobuf2-dma-contig.c    |   19 -
 drivers/media/common/videobuf2/videobuf2-dma-sg.c        |    3 
 drivers/media/common/videobuf2/videobuf2-v4l2.c          |   12 
 drivers/net/ethernet/amd/au1000_eth.c                    |   15 -
 drivers/net/ethernet/i825xx/lasi_82596.c                 |   36 +-
 drivers/net/ethernet/i825xx/lib82596.c                   |  148 +++++-----
 drivers/net/ethernet/i825xx/sni_82596.c                  |   23 -
 drivers/net/ethernet/seeq/sgiseeq.c                      |   24 -
 drivers/nvme/host/pci.c                                  |   79 ++---
 drivers/parisc/ccio-dma.c                                |    2 
 drivers/parisc/sba_iommu.c                               |    2 
 drivers/scsi/53c700.c                                    |  120 ++++----
 drivers/scsi/53c700.h                                    |    9 
 drivers/scsi/sgiwd93.c                                   |   14 
 drivers/xen/swiotlb-xen.c                                |    2 
 include/linux/dma-direct.h                               |   55 ++-
 include/linux/dma-mapping.h                              |   32 +-
 include/linux/dma-noncoherent.h                          |   21 -
 include/linux/dmapool.h                                  |   23 +
 include/linux/gfp.h                                      |    6 
 include/media/videobuf2-core.h                           |    3 
 include/uapi/linux/videodev2.h                           |    2 
 kernel/dma/Kconfig                                       |    9 
 kernel/dma/Makefile                                      |    1 
 kernel/dma/coherent.c                                    |   17 +
 kernel/dma/direct.c                                      |  112 +++++--
 kernel/dma/mapping.c                                     |  104 ++-----
 kernel/dma/ops_helpers.c                                 |   86 ++++++
 kernel/dma/pool.c                                        |    2 
 kernel/dma/swiotlb.c                                     |    4 
 kernel/dma/virt.c                                        |    2 
 mm/dmapool.c                                             |  211 +++++++++------
 sound/mips/hal2.c                                        |   58 +---
 71 files changed, 872 insertions(+), 803 deletions(-)
_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
