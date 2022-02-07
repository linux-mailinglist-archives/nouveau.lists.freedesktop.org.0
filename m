Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F7BC4AC058
	for <lists+nouveau@lfdr.de>; Mon,  7 Feb 2022 15:01:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F328C10E5DC;
	Mon,  7 Feb 2022 14:01:31 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-qk1-x733.google.com (mail-qk1-x733.google.com
 [IPv6:2607:f8b0:4864:20::733])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C47B10E5A8
 for <nouveau@lists.freedesktop.org>; Mon,  7 Feb 2022 14:01:30 +0000 (UTC)
Received: by mail-qk1-x733.google.com with SMTP id bs32so10955341qkb.1
 for <nouveau@lists.freedesktop.org>; Mon, 07 Feb 2022 06:01:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ziepe.ca; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=+VH5Yzc0FArtBDlyVciKdTaJzlAuXtplA0CDhVkYZVw=;
 b=TUJuhAgjjswNVQ7JzTkg9iKkOgM430mBd5iaZFyVB8juiwGMelroxSVc/tEeoVjS03
 SBBJAs6XyaJLOH0zNh1fMB11MocmBy0vZW3lQVqwc7nmLVkUib5NLDfgXeW1egoLcrUl
 0zJ1M9G8GricJAi2JHxOQgJzIsENPf4oXdSlLGMn1ou/GSiwitfE+Re74s2OC3cGYiXS
 WAB6PyKR8iNz2aNJcgzl/Jv2b00SlxQrNVuEW+ZJ8pyVvgvQpU41dl5hiuO86kWk7vjX
 6XluH9RnX42crAJsdacFsF/M+gN0YxPG9aqIQm6tHe1mZG9Uo38/MZ0gAIlPcqFBC8jG
 7hCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=+VH5Yzc0FArtBDlyVciKdTaJzlAuXtplA0CDhVkYZVw=;
 b=lP7UXprTt1su5W58PgDZdAwYPlEKlJgQBRNh9CyH2dExwTGYTjSxpK6TF+/4emginR
 J/Kp8hCqvDU4b2CntLTPVSqSsc4/IaWmu4TsZ+ArbO5bikGpYHlesAY65U7UpEeagqgt
 y2CbodCQVsvw4hZ715OCKJFN63xf2S5aqKkTVI7TcKUexOHzawgBqFncH/W1ztcUxMOO
 NPgQlDERVpmisBdjmKJa+LvKC5sFdgCBAwNyzwWHeKE8Vd2CliPLG+M3yi+Nn9CqAGKm
 PGtBfgbe+qib8mU9AMCGg8ASkjaTaUpOEBAEBXWuOwVF3igtyW6uHeTj0a5ZO881/yMP
 10cg==
X-Gm-Message-State: AOAM532iCJLIPsbqu5TtRyL7P2qkc/J1RJjOPIIT/ljpSYREnqtMExZr
 /ythxr1ZNvLzIRqflosrcakYMQ==
X-Google-Smtp-Source: ABdhPJxewUAI8RDxJecgMQqK84dnZDRSuWWALhikOi914YekMnNecZIoiX1AIBCzbrtZ6bBwZBwWpw==
X-Received: by 2002:a37:2c02:: with SMTP id s2mr6217893qkh.76.1644242489492;
 Mon, 07 Feb 2022 06:01:29 -0800 (PST)
Received: from ziepe.ca
 (hlfxns017vw-142-162-113-129.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [142.162.113.129])
 by smtp.gmail.com with ESMTPSA id f4sm5480989qko.72.2022.02.07.06.01.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Feb 2022 06:01:28 -0800 (PST)
Received: from jgg by mlx with local (Exim 4.94) (envelope-from <jgg@ziepe.ca>)
 id 1nH4a7-000CyH-Do; Mon, 07 Feb 2022 10:01:27 -0400
Date: Mon, 7 Feb 2022 10:01:27 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Christoph Hellwig <hch@lst.de>
Message-ID: <20220207140127.GA49147@ziepe.ca>
References: <20220207063249.1833066-1-hch@lst.de>
 <20220207063249.1833066-4-hch@lst.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220207063249.1833066-4-hch@lst.de>
Subject: Re: [Nouveau] [PATCH 3/8] mm: remove pointless includes from
 <linux/hmm.h>
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

On Mon, Feb 07, 2022 at 07:32:44AM +0100, Christoph Hellwig wrote:
> hmm.h pulls in the world for no good reason at all.  Remove the
> includes and push a few ones into the users instead.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>  drivers/gpu/drm/amd/amdkfd/kfd_migrate.c | 1 +
>  drivers/gpu/drm/nouveau/nouveau_dmem.c   | 1 +
>  include/linux/hmm.h                      | 9 ++-------
>  lib/test_hmm.c                           | 2 ++
>  4 files changed, 6 insertions(+), 7 deletions(-)

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

Jason
