Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9099E188C27
	for <lists+nouveau@lfdr.de>; Tue, 17 Mar 2020 18:32:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04D586E24E;
	Tue, 17 Mar 2020 17:32:18 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-qt1-x841.google.com (mail-qt1-x841.google.com
 [IPv6:2607:f8b0:4864:20::841])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 983196E7D3
 for <nouveau@lists.freedesktop.org>; Tue, 17 Mar 2020 17:32:16 +0000 (UTC)
Received: by mail-qt1-x841.google.com with SMTP id i26so8403204qtq.8
 for <nouveau@lists.freedesktop.org>; Tue, 17 Mar 2020 10:32:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ziepe.ca; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=Q/uuGRZEOsDl+bE2n4dBjQindS2U+dSkshg9e/3rsJY=;
 b=FU4iUBgbL/YDOzKu+bjTnxXn9TflPig4spFWJmilzk34kRefbe53ABssDpnYq4RxiZ
 n+O0F9b3g0saj53WHsCNw5lj/7/hY9KDJgPbxFKg1RV/01pre5JdZmlAkXMNQHxWapmi
 GprzttsXWQT9FXf/jK4VEXwggJDPRtExDhINmyI8LiapOrpi52Hmxmp/qtYxgvT0ClFa
 00xf+UmfedAWNC5qQzvH5yQdL0FIMlujhU3Kt/3E0lniCZy7MVtlf7dJy6MDyLvq5A+d
 NsyuTABobaFq0uYwqJPFhHf545MhX77WFDFIuE4jQpUv4U9urn5L79qq79pmeF23Wts7
 R4jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=Q/uuGRZEOsDl+bE2n4dBjQindS2U+dSkshg9e/3rsJY=;
 b=iBAq9kH438/06dqJ4AdU+EugFhznquDbBZUxIIvDFUF9kKYry3a6E4uLBlS5rdvdHe
 SxlmAxLSgBA/zFPOK/xIsLjFEZH38jsK+xivL7widgQIpH0rNxdf/7uCTjge2RsmD1Ji
 lDW3IYdqREavwgERlndUo8cK8AtnclfA1RTtWMwFnv2gVd2n0ft459yEk6EytSDVpwN6
 hs/TQhaMISQSp1QcsqsxQmdl84XlOIiERxSmxEsNgH0A6kNQH2Gb1vwqZoToNOm2pS+T
 a4dPGscut+pmmsmBQ75Lf4pQ3tMkvK248eDYqtlNhihxQgNJpsmZD0FSin3tr1k4CvT/
 OOIA==
X-Gm-Message-State: ANhLgQ2rI3jx+9VAsVqufYaBVAAtwJCZnjII6vxdzpuQHr9AXbkLYxhJ
 Nnodguzv2WB9suFJCRDmGuh2LA==
X-Google-Smtp-Source: ADFU+vvQkJHNXbvVdLtnlJMGZHp70Sk2ysRUXTAeHVBKUuaYuYs7P0Nymi41g21wcvfTtdp5N+dboA==
X-Received: by 2002:ac8:184f:: with SMTP id n15mr190677qtk.371.1584466335681; 
 Tue, 17 Mar 2020 10:32:15 -0700 (PDT)
Received: from ziepe.ca
 (hlfxns017vw-142-68-57-212.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [142.68.57.212])
 by smtp.gmail.com with ESMTPSA id z1sm2584388qtc.51.2020.03.17.10.32.14
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 17 Mar 2020 10:32:14 -0700 (PDT)
Received: from jgg by mlx.ziepe.ca with local (Exim 4.90_1)
 (envelope-from <jgg@ziepe.ca>)
 id 1jEG4c-0006CT-8g; Tue, 17 Mar 2020 14:32:14 -0300
Date: Tue, 17 Mar 2020 14:32:14 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Christoph Hellwig <hch@lst.de>
Message-ID: <20200317173214.GT20941@ziepe.ca>
References: <20200316193216.920734-1-hch@lst.de>
 <20200316193216.920734-4-hch@lst.de>
 <7256f88d-809e-4aba-3c46-a223bd8cc521@nvidia.com>
 <20200317121536.GQ20941@ziepe.ca> <20200317122445.GA11662@lst.de>
 <20200317122813.GA11866@lst.de> <20200317124755.GR20941@ziepe.ca>
 <20200317125955.GA12847@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200317125955.GA12847@lst.de>
User-Agent: Mutt/1.9.4 (2018-02-28)
Subject: Re: [Nouveau] [PATCH 3/4] mm: simplify device private page handling
 in hmm_range_fault
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
Cc: Ralph Campbell <rcampbell@nvidia.com>, amd-gfx@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 kvm-ppc@vger.kernel.org, Bharata B Rao <bharata@linux.ibm.com>,
 linux-mm@kvack.org, Ben Skeggs <bskeggs@redhat.com>,
 Dan Williams <dan.j.williams@intel.com>,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On Tue, Mar 17, 2020 at 01:59:55PM +0100, Christoph Hellwig wrote:
> On Tue, Mar 17, 2020 at 09:47:55AM -0300, Jason Gunthorpe wrote:
> > I've been using v7 of Ralph's tester and it is working well - it has
> > DEVICE_PRIVATE support so I think it can test this flow too. Ralph are
> > you able?
> > 
> > This hunk seems trivial enough to me, can we include it now?
> 
> I can send a separate patch for it once the tester covers it.  I don't
> want to add it to the original patch as it is a significant behavior
> change compared to the existing code.

Okay. I'm happy enough for now that amdgpu will get ERROR on
device_private pages. That is a bug fix in of itself.

Jason
_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
