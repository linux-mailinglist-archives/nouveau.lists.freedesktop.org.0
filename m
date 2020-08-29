Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AA95F2568E6
	for <lists+nouveau@lfdr.de>; Sat, 29 Aug 2020 17:59:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 911238929C;
	Sat, 29 Aug 2020 15:59:33 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E9D86E1BD
 for <nouveau@lists.freedesktop.org>; Sat, 29 Aug 2020 09:53:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1598694804;
 bh=3F15H2PNzBIc0EFjrxqHH0XfkEEFa8OSmYddqGK8H+0=;
 h=X-UI-Sender-Class:Subject:To:Cc:References:From:Date:In-Reply-To;
 b=hcQlfQql2ungJoVZBC1Urmf14x+aOIiys7oUGVij0eRz/RYl8cZvClebaa+kxV1D2
 /APa1Nl1hlp9/oaVpJlrD7sbcEVU23smUq916bXWVuX9ZkUz+jCMz9CQlUbUBx+4AL
 P7d3zhaPFvj07Pspbb11Q28YmEHDTp0UDQh+BMek=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.20.60] ([92.116.169.105]) by mail.gmx.com (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MryTF-1kzqb42Rgj-00nwOw; Sat, 29
 Aug 2020 11:47:03 +0200
To: Christoph Hellwig <hch@lst.de>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 Joonyoung Shim <jy0922.shim@samsung.com>,
 Seung-Woo Kim <sw0312.kim@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>, Ben Skeggs <bskeggs@redhat.com>,
 Pawel Osciak <pawel@osciak.com>, Marek Szyprowski
 <m.szyprowski@samsung.com>, Matt Porter <mporter@kernel.crashing.org>,
 iommu@lists.linux-foundation.org
References: <20200819065555.1802761-1-hch@lst.de>
From: Helge Deller <deller@gmx.de>
Autocrypt: addr=deller@gmx.de; keydata=
 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
 c2TFWAS8k6RLkk41ZUU8ENX8+qZx/Q==
Message-ID: <73b81ba2-3f1c-cce9-0bcf-e739c2a2f6d8@gmx.de>
Date: Sat, 29 Aug 2020 11:46:56 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200819065555.1802761-1-hch@lst.de>
Content-Language: en-US
X-Provags-ID: V03:K1:oJ0DWTaeXj/z2c6/t19vHP7YStT4MiWtTWeFmCetTtBo49Hh4sa
 MXIOt4fOrWhKcajKOQn9yDtXPWoBtqQjT0jJihKGRY7MdilOq6ZLvEQJAHP/3tQc3VMSqjw
 8nrw+oyKRGNPfYAhYsTPKH1SOnK7ozn1tLaEFYkGuZxVaZV1fMUaMHgotwKVH1EV+Qr8QAH
 zOF0hIOTIYaJkqfweauPA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:oHSQj6uzgbs=:9C0mK1lZcfkvA2123eaF+b
 9SWScLmHqZNkQPtgxx+DIA1Wx4AbCyw7U69xQrJp3wdxyhEgKAClJOXfUg15MYUsMo+qXqXc+
 9CCxR+kQCRtjwPYK5cDp+/WLpz2R6jx+evW1yy1t7a09nHa45PjHejtyz21Qdik/HgA5GPEtx
 LnHngBwjp4fRqZK9+HvoScT1VYJ1kJPb5Ovi27u20LOK/A4mAdekR7lP05idMX5oidcCmjF40
 zWAasJy+4PofxDJ4uBcFC9SZBfqFNYNdff6MeNYbp6NEBQ+qwvdRdWuhO8jwEzEsocVNdktlG
 llLg1q+ZVu1s/xSG3eSioLMKA3qTx4yLICpbwe5jeg8WBTDR464a5GFUyUrNBbybu6TTzza5y
 iBZFAfqwts2Kr9q5BO8EqqQpo50AbHwayu4Akor29O9cYqa10uFegpveriWsW0oB6rbNsE3Rj
 b+kgqF6j4T51qZS/Ielm+Ie1M1vnKxSnaB3E41X0/WERMcHAfPcqcnelvZu3QvtrShEmjY115
 zm0R7zQARUKs8IguGdfxaN4e/mAw9A4yFxsOSFsUuQ21/rR9H3EjdDKZqKvdZh7w11HgJ5fcV
 4Uy6nLaO78c3/UfOl3xVmwJOOohlH9uxcviS53WnpCa4QbVTai94jx8sicCjtHSgKSs40QxvE
 lu2zQFAqgiWwD7QzgAr7sL2DBp+KgaoQ5E7tb7d9nbN5Jfg9AWueFA4u9wi6FtCLVW94ASC7/
 oUesge64z59GYBR6XnrC0pK7LR6A8zibhOPJN/L4WywrQMUMg++I/EyMUPgLC2zeyYVY5RTHu
 SF05Icyji9ysGKlDOVf5Bw2AJAEG5xY+A6gFHJj0++t+NGC5ZkCIGZf40c2/2/q0IAEZFqNWC
 6sfyPwn1hySrgdB5xXIoNouA+DTslMDokbpQGpbPuzXkiR7gWITfcMiVx+qYMQGJzn15EnoiT
 dsna86sXwGsdunmatI4qS2VJECWj+DMBfvf9U3Xi+vnQaYX24P22KV+Z+bSjt/uH/k3mqb30/
 l4NpRB1m8dwE3DSMeGd8gqMNKL77QVbXykWRF6cEGxMVlZkGRonpmlFexM6U741+DQUje+J7I
 RhMfUa8WNlpuMSPkNN30ZLL8g8SEQiioJhV+RJROGb7kccRKefqyDkHTGSCCJp+2nVX/JvZf2
 L+ed5QeU+72uFp7qIdcJ8kP/Oe0ITXmDAYeeqqNljX610C7SOtaexYeAGQ6iaZ23+raPAs4KF
 jDj2ukca0ucYqDfDS
X-Mailman-Approved-At: Sat, 29 Aug 2020 15:59:32 +0000
Subject: Re: [Nouveau] a saner API for allocating DMA addressable pages
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

Hi Christoph,

On 19.08.20 08:55, Christoph Hellwig wrote:
> this series replaced the DMA_ATTR_NON_CONSISTENT flag to dma_alloc_attrs
> with a separate new dma_alloc_pages API, which is available on all
> platforms.  In addition to cleaning up the convoluted code path, this
> ensures that other drivers that have asked for better support for
> non-coherent DMA to pages with incurring bounce buffering over can finally
> be properly supported.
> ....
> A git tree is available here:
>
>     git://git.infradead.org/users/hch/misc.git dma_alloc_pages

I've tested this tree on my parisc machine which uses the 53c700
and lasi_82596 drivers.
Everything worked as expected, so you may add:

Tested-by: Helge Deller <deller@gmx.de> # parisc

Thanks!
Helge

>
> Gitweb:
>
>     http://git.infradead.org/users/hch/misc.git/shortlog/refs/heads/dma_alloc_pages
>
>
> Diffstat:
>  Documentation/core-api/dma-api.rst                       |   92 ++----
>  Documentation/core-api/dma-attributes.rst                |    8
>  Documentation/userspace-api/media/v4l/buffer.rst         |   17 -
>  Documentation/userspace-api/media/v4l/vidioc-reqbufs.rst |    1
>  arch/alpha/kernel/pci_iommu.c                            |    2
>  arch/arm/include/asm/dma-direct.h                        |    4
>  arch/arm/mm/dma-mapping-nommu.c                          |    2
>  arch/arm/mm/dma-mapping.c                                |    4
>  arch/ia64/Kconfig                                        |    3
>  arch/ia64/hp/common/sba_iommu.c                          |    2
>  arch/ia64/kernel/dma-mapping.c                           |   14
>  arch/ia64/mm/init.c                                      |    3
>  arch/mips/Kconfig                                        |    1
>  arch/mips/bmips/dma.c                                    |    4
>  arch/mips/cavium-octeon/dma-octeon.c                     |    4
>  arch/mips/include/asm/dma-direct.h                       |    4
>  arch/mips/include/asm/jazzdma.h                          |    2
>  arch/mips/jazz/jazzdma.c                                 |  102 +------
>  arch/mips/loongson2ef/fuloong-2e/dma.c                   |    4
>  arch/mips/loongson2ef/lemote-2f/dma.c                    |    4
>  arch/mips/loongson64/dma.c                               |    4
>  arch/mips/mm/dma-noncoherent.c                           |   48 +--
>  arch/mips/pci/pci-ar2315.c                               |    4
>  arch/mips/pci/pci-xtalk-bridge.c                         |    4
>  arch/mips/sgi-ip32/ip32-dma.c                            |    4
>  arch/parisc/Kconfig                                      |    1
>  arch/parisc/kernel/pci-dma.c                             |    6
>  arch/powerpc/include/asm/dma-direct.h                    |    4
>  arch/powerpc/kernel/dma-iommu.c                          |    2
>  arch/powerpc/platforms/ps3/system-bus.c                  |    4
>  arch/powerpc/platforms/pseries/vio.c                     |    2
>  arch/s390/pci/pci_dma.c                                  |    2
>  arch/x86/kernel/amd_gart_64.c                            |    8
>  drivers/gpu/drm/exynos/exynos_drm_gem.c                  |    2
>  drivers/gpu/drm/nouveau/nvkm/subdev/instmem/gk20a.c      |    3
>  drivers/iommu/dma-iommu.c                                |    2
>  drivers/iommu/intel/iommu.c                              |    6
>  drivers/media/common/videobuf2/videobuf2-core.c          |   36 --
>  drivers/media/common/videobuf2/videobuf2-dma-contig.c    |   19 -
>  drivers/media/common/videobuf2/videobuf2-dma-sg.c        |    3
>  drivers/media/common/videobuf2/videobuf2-v4l2.c          |   12
>  drivers/net/ethernet/amd/au1000_eth.c                    |   15 -
>  drivers/net/ethernet/i825xx/lasi_82596.c                 |   36 +-
>  drivers/net/ethernet/i825xx/lib82596.c                   |  148 +++++-----
>  drivers/net/ethernet/i825xx/sni_82596.c                  |   23 -
>  drivers/net/ethernet/seeq/sgiseeq.c                      |   24 -
>  drivers/nvme/host/pci.c                                  |   79 ++---
>  drivers/parisc/ccio-dma.c                                |    2
>  drivers/parisc/sba_iommu.c                               |    2
>  drivers/scsi/53c700.c                                    |  120 ++++----
>  drivers/scsi/53c700.h                                    |    9
>  drivers/scsi/sgiwd93.c                                   |   14
>  drivers/xen/swiotlb-xen.c                                |    2
>  include/linux/dma-direct.h                               |   55 ++-
>  include/linux/dma-mapping.h                              |   32 +-
>  include/linux/dma-noncoherent.h                          |   21 -
>  include/linux/dmapool.h                                  |   23 +
>  include/linux/gfp.h                                      |    6
>  include/media/videobuf2-core.h                           |    3
>  include/uapi/linux/videodev2.h                           |    2
>  kernel/dma/Kconfig                                       |    9
>  kernel/dma/Makefile                                      |    1
>  kernel/dma/coherent.c                                    |   17 +
>  kernel/dma/direct.c                                      |  112 +++++--
>  kernel/dma/mapping.c                                     |  104 ++-----
>  kernel/dma/ops_helpers.c                                 |   86 ++++++
>  kernel/dma/pool.c                                        |    2
>  kernel/dma/swiotlb.c                                     |    4
>  kernel/dma/virt.c                                        |    2
>  mm/dmapool.c                                             |  211 +++++++++------
>  sound/mips/hal2.c                                        |   58 +---
>  71 files changed, 872 insertions(+), 803 deletions(-)
>

_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
