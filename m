Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 13FD74AC9AF
	for <lists+nouveau@lfdr.de>; Mon,  7 Feb 2022 20:36:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 40DD410F967;
	Mon,  7 Feb 2022 19:36:20 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-qv1-xf33.google.com (mail-qv1-xf33.google.com
 [IPv6:2607:f8b0:4864:20::f33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9549510F968
 for <nouveau@lists.freedesktop.org>; Mon,  7 Feb 2022 19:36:19 +0000 (UTC)
Received: by mail-qv1-xf33.google.com with SMTP id a28so5063920qvb.10
 for <nouveau@lists.freedesktop.org>; Mon, 07 Feb 2022 11:36:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ziepe.ca; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=AZb+VjqCK8DT8gUN4DVyYxz5ldTv3hxfq1kOHV3So/k=;
 b=KntHAMqOekGnRUkUpQJ4RmJ6jMnHjUV7NyerhvsEdoAGvARGmb4G3Wj/k8wnWrJ4v5
 8kPwNbh9XAYp6cLgi4gIv627uiqcRa+LFZjBeDErIxOg8LxHgVSzpBBgB4/02CnckDoW
 j/vS99YpkyicivGZvG7tPxKD1tg9I4Ra2r60sYYIh7hopzEEGFHdBxN13YaxsF1pjtQ4
 t2UWWLHBR9zIycMbU/55yGUwhwjflg+CGCZLsD+asK60z79VcLiGPwy6B0EGe8DupEXr
 Ad4Gbvw45NbEij0sfEUWdE7DXdHVlwqV31kqZB6dVE9msUcvQULHgg4p2QKDUMuJskEz
 lXAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=AZb+VjqCK8DT8gUN4DVyYxz5ldTv3hxfq1kOHV3So/k=;
 b=hUZQNZajdoUuYVPBcn4eKJkUxymjGZ/pURj6bdIQtpoN1KwDhpfKpzCjbSgEuvxjaM
 T/jJzbC4e9yEmHOidtFZs/nkPK6gywoWFG5OPtcxam13tLgdee6u1fDOf5hklQwBQ0jn
 5v0yVfTG7tApiTyxCvQyjKPgzl63m7OMEK+AUHT3Sqqvx8C/mm2/Q6S+uAsCc+oEqU+Q
 562SV3HlSJpVjQeEecpue8iQ9IdKU5LhEh1PxVFUJYzYePx4pAXMwbsB+IIHqbkrV4wL
 8dcBih+wI3VhdkSj5YOD8sHwBkkTzpo39eLrvjxa2huhjGIQIXvU5oLoWkgBHO1ixkQt
 8cLw==
X-Gm-Message-State: AOAM532ja+MANs3zn563D2j0GMyGXHAgLuQj0AhF42Umz7zWQLybR0rl
 RsKe819cRTR1BohC9DWRQcBYEA==
X-Google-Smtp-Source: ABdhPJx0Ja9WLXhMDJ89Idc/sHv1PbTV/zifEfvcLL+6K0fCDuGFFRfG8vhitXIXvhCy0TtD+Fimvw==
X-Received: by 2002:a05:6214:2aad:: with SMTP id
 js13mr896600qvb.32.1644262578716; 
 Mon, 07 Feb 2022 11:36:18 -0800 (PST)
Received: from ziepe.ca
 (hlfxns017vw-142-162-113-129.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [142.162.113.129])
 by smtp.gmail.com with ESMTPSA id h1sm5945976qkn.71.2022.02.07.11.36.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Feb 2022 11:36:18 -0800 (PST)
Received: from jgg by mlx with local (Exim 4.94) (envelope-from <jgg@ziepe.ca>)
 id 1nH9o9-000I7B-La; Mon, 07 Feb 2022 15:36:17 -0400
Date: Mon, 7 Feb 2022 15:36:17 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Christoph Hellwig <hch@lst.de>
Message-ID: <20220207193617.GH49147@ziepe.ca>
References: <20220207063249.1833066-1-hch@lst.de>
 <20220207063249.1833066-9-hch@lst.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220207063249.1833066-9-hch@lst.de>
Subject: Re: [Nouveau] [PATCH 8/8] fsdax: depend on ZONE_DEVICE ||
 FS_DAX_LIMITED
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

On Mon, Feb 07, 2022 at 07:32:49AM +0100, Christoph Hellwig wrote:
> Add a depends on ZONE_DEVICE support or the s390-specific limited DAX
> support, as one of the two is required at runtime for fsdax code to
> actually work.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>  fs/Kconfig | 1 +
>  1 file changed, 1 insertion(+)

Makes sense, but leaves me wonder why a kconfig randomizer didn't hit
this.. Or maybe it means some of the function stubs on !ZONE_DEVICE
are unnecessary now..

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

Jason
