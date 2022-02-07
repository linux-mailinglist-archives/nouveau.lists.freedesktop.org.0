Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 43C814AC97A
	for <lists+nouveau@lfdr.de>; Mon,  7 Feb 2022 20:27:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 392E210F8EB;
	Mon,  7 Feb 2022 19:27:34 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-qt1-x82d.google.com (mail-qt1-x82d.google.com
 [IPv6:2607:f8b0:4864:20::82d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 68F2310F8E7
 for <nouveau@lists.freedesktop.org>; Mon,  7 Feb 2022 19:27:32 +0000 (UTC)
Received: by mail-qt1-x82d.google.com with SMTP id e16so12840097qtq.6
 for <nouveau@lists.freedesktop.org>; Mon, 07 Feb 2022 11:27:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ziepe.ca; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=BoyrZhI/SFo2F7HoszDIan4CMWU1RWbm6+Gl19zQGEA=;
 b=Ch8C10PSNgUgzrJSYUwNmUYPnK3KqD5nVzs8U25K8dQe5Nz0RHnqD34dfcVzOfHQn0
 Z7A2NrwTV3T8U5qAOPkdl18fdhCkDtt27sDhMF9az9KwL3bhZc1wWsNakacs8mHp4+2i
 ATHSdkH9LZE8z74Q7FsDuavDIliXPR3QE65Wv381+/ZcyQuEMN7ZFrlis4MW0UWFA66p
 hAq2I0gQh10LCJLc1hBJhl0b+SX/rRCFuGSDgkT7h5GKbOua68a4YV58mo6/qZ9LpsXw
 xHl/NBuQ1Pg3+hWr0zmMYM2z5/HBKY5RxkuejNX/FdePkUnSlgZKK24pt/x4bYmxOQsS
 FISQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=BoyrZhI/SFo2F7HoszDIan4CMWU1RWbm6+Gl19zQGEA=;
 b=i7xMiQP8i+7YCSAWm42etuVppGommSa0ykUAsWoRSthZ615CVi4gW1fpb+ZsbeEjnj
 UihAFkCI3CjXztYFgE4F5r+0SvBiRRrjQtzS1r0e8n79BcTKFbNWLOnGoVlJ1qECTfJl
 r5hWOiIFKT3KsebnZq6tMXp1nl0i+tORA2lrP/JZu17fRcbQNgeJl1d7/s0gDv28pZ1v
 /2w7yf6D7kfA2cmdnSQABfGdpEoxFV+BU3yuji97w8DDMbhYRBh9HvbdYnX3KXWNqrKi
 dJk/xypk244iCLlyVZ5qta+y2/RFDpezRsRjYRZH1yK1AHRDzx9pWJDrQkPT5ymaZcKx
 htBw==
X-Gm-Message-State: AOAM53181sHfafSJql1kUgl4sStdwUdrTeT4jJY5J8YlCP+NAycBbxPV
 dxiSITY6bZ8BODPS1ve8ixlhww==
X-Google-Smtp-Source: ABdhPJxE/dHX+9xmPplXl1VvJP7kBTi3tiLgJTGk2+Y/ZJni8J0n6I1+6ACqdKe2xRydNCRf+KVUww==
X-Received: by 2002:ac8:7ca4:: with SMTP id z4mr750427qtv.526.1644262051598;
 Mon, 07 Feb 2022 11:27:31 -0800 (PST)
Received: from ziepe.ca
 (hlfxns017vw-142-162-113-129.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [142.162.113.129])
 by smtp.gmail.com with ESMTPSA id de15sm5546110qkb.107.2022.02.07.11.27.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Feb 2022 11:27:31 -0800 (PST)
Received: from jgg by mlx with local (Exim 4.94) (envelope-from <jgg@ziepe.ca>)
 id 1nH9fe-000HwP-GM; Mon, 07 Feb 2022 15:27:30 -0400
Date: Mon, 7 Feb 2022 15:27:30 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Christoph Hellwig <hch@lst.de>
Message-ID: <20220207192730.GE49147@ziepe.ca>
References: <20220207063249.1833066-1-hch@lst.de>
 <20220207063249.1833066-5-hch@lst.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220207063249.1833066-5-hch@lst.de>
Subject: Re: [Nouveau] [PATCH 4/8] mm: move free_devmap_managed_page to
 memremap.c
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
Cc: nvdimm@lists.linux.dev, Ralph Campbell <rcampbell@nvidia.com>,
 Alistair Popple <apopple@nvidia.com>, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, Felix Kuehling <Felix.Kuehling@amd.com>, "Pan,
 Xinhui" <Xinhui.Pan@amd.com>, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>, linux-mm@kvack.org,
 Ben Skeggs <bskeggs@redhat.com>, Alex Deucher <alexander.deucher@amd.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Logan Gunthorpe <logang@deltatee.com>, Dan Williams <dan.j.williams@intel.com>
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On Mon, Feb 07, 2022 at 07:32:45AM +0100, Christoph Hellwig wrote:
> free_devmap_managed_page has nothing to do with the code in swap.c,
> move it to live with the rest of the code for devmap handling.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>  include/linux/mm.h |  1 -
>  mm/memremap.c      | 21 +++++++++++++++++++++
>  mm/swap.c          | 23 -----------------------
>  3 files changed, 21 insertions(+), 24 deletions(-)

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

Jason
