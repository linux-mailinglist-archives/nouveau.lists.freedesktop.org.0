Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C95A97C7CF6
	for <lists+nouveau@lfdr.de>; Fri, 13 Oct 2023 07:20:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5BE3410E59C;
	Fri, 13 Oct 2023 05:20:24 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:3::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8DC5B10E59C;
 Fri, 13 Oct 2023 05:20:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Transfer-Encoding
 :Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
 Sender:Reply-To:Content-ID:Content-Description;
 bh=IM1xqhQiNvzRJZGajZrRp+LdnwXH066EKRxfyQrcNi8=; b=ZvyTrqkrAN7Qc7crzmwXDnKrHa
 waG3CZZS3FecTquZSP1nPPg7fQ9RryHLefYK6MQRdKgX+V4OSBJZB/fwlA8y5y4FLxkgPzfBn3wCA
 HAn8SMW4bhBIqo74p36tlscFvOhFauHnQznGcB6kvjEMnXff5hNcUIRdMAGfFaey8LfUQOhUcU8K6
 cYPCtARqnK/d8376LDNJJyx1nziN7Hj0DYuE7Vgm14aXSI/f9wEfYDuThMn/v+XCLvi4kTjRiFa4S
 ND+itvx2zadRaF8SlF16h9qX/L3GA/I9j10NWddxZBB0e04tFm+ba+J8/K9M3Dr1Sp+4H+5Uvnqmo
 Jqb2zzEQ==;
Received: from hch by bombadil.infradead.org with local (Exim 4.96 #2 (Red Hat
 Linux)) id 1qrAaH-002VYo-2L; Fri, 13 Oct 2023 05:19:37 +0000
Date: Thu, 12 Oct 2023 22:19:37 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Message-ID: <ZSjTaYSbegbhon2v@infradead.org>
References: <ZO9Zq2RhbX8EeHrn@pollux>
 <736b6b6d-9e04-a27d-7d60-0c45d696b304@shipmail.org>
 <ZPB26A0/oLHTmyqk@cassiopeiae>
 <a8f28d62-daec-927a-a33d-5be3eec6a1ed@shipmail.org>
 <ZPDk/lao1JlBNGoJ@cassiopeiae>
 <8a8253ae-0b85-df90-b480-64eeebfafc6d@shipmail.org>
 <CAPM=9tz3o-m+8VJJ6hxWhykat0kpp1UE7dBJE3X91aHHo1Y2VA@mail.gmail.com>
 <76963abd-77a1-4bbd-9537-7b230e648a90@amd.com>
 <CAPM=9twSHGRoSoXxG+hz1T8iBX2VgPFvFsNCDnK_nHW9WJYBtw@mail.gmail.com>
 <1333e15b-f229-460a-8965-01ff3e778a4d@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1333e15b-f229-460a-8965-01ff3e778a4d@amd.com>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
Subject: Re: [Nouveau] [PATCH drm-misc-next 2/3] drm/gpuva_mgr: generalize
 dma_resv/extobj handling and GEM validation
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
Cc: matthew.brost@intel.com, thomas.hellstrom@linux.intel.com,
 sarah.walker@imgtec.com, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org,
 Thomas =?iso-8859-1?Q?Hellstr=F6m_=28Intel=29?= <thomas_os@shipmail.org>,
 linux-kernel@vger.kernel.org, Liam.Howlett@oracle.com,
 boris.brezillon@collabora.com, donald.robson@imgtec.com, daniel@ffwll.ch,
 faith.ekstrand@collabora.com, bskeggs@redhat.com
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On Thu, Oct 12, 2023 at 02:35:15PM +0200, Christian König wrote:
> Additional to that from the software side Felix summarized it in the HMM
> peer2peer discussion thread recently quite well.

Do you have a pointer to that discussion?

