Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CEF59A0ECE
	for <lists+nouveau@lfdr.de>; Wed, 16 Oct 2024 17:45:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F57710E743;
	Wed, 16 Oct 2024 15:45:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=ziepe.ca header.i=@ziepe.ca header.b="bPbaNXJ4";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com
 [209.85.160.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 520DB10E741
 for <nouveau@lists.freedesktop.org>; Wed, 16 Oct 2024 15:45:57 +0000 (UTC)
Received: by mail-qt1-f175.google.com with SMTP id
 d75a77b69052e-46098928354so2065461cf.1
 for <nouveau@lists.freedesktop.org>; Wed, 16 Oct 2024 08:45:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ziepe.ca; s=google; t=1729093556; x=1729698356; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=EEZ2LDphVBRKBdoRQ+LSrY20LCMSUc6nsUE9KVF2o3U=;
 b=bPbaNXJ4oKS/mqCV4PS3Z4G1HZ7LNdrU4GRAzuKCp5tGcfDnSSypJsV0TOH4JDuvwn
 yO13cNCRFzNHYOoE4RwBsOXHlb0fY3GqtOZXDWdsPRa5UJqIoFPTtGZef7MtPN4NN0pB
 rR5smSSrjknDy7xZOuU0jF233f/hLkVHnksNEczeySRRJmgR/YbuBIP4LfnA0rilXM8f
 L2OPmRpPevxi/+rtboORxgxvfm7nqui84cEdPzP8aLlFl1GyO5eWGIaS4Xyxo7Bdnoft
 dThzoqThWk4B8JTGNpIcL3h8uYaGnjSCtP11oXt1K5Nhga6XUJiMLCGNNdTIYAMb3M+P
 uHNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729093556; x=1729698356;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=EEZ2LDphVBRKBdoRQ+LSrY20LCMSUc6nsUE9KVF2o3U=;
 b=RSFlWTPowIGd1Sp6MZNmFy0pWKRQC2XBTFbgBBO/XYTsDOmvKle8u0Y0z3p+TehVhM
 DYzVmpY71WnvIL6wCDUfUYBXz2WpB+dK4Iv3IBVB+BBE7KutEsHd/8EHZmSMfW5owVvO
 gpl1aotVgamK/03QQPHTnC3oaFON4/X5l1hbupElcf241Ceg34gmTgwVpcX/dViv9e30
 otdcZRqMxLGt035A0e5ZDcdV2Gnf0JlJiopwkax/8ThHb2hqG2iNk2welO+nVh4TRS+Q
 4dYpXoZx5xDoNXgpd15YPsJyIZ9/9Z/d7pj6FR/Y3IjUaBpsNoeMej5Ib5YKk82V8LdM
 pMmg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVEz4GIf50/0zO+/13AGtgBEde8T71ajZuA79CB3demU3PuLU6EDPIebeNkqLjA8429tD5QXfm7@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzNKACEbMc0rj+UfnI1NYXr5bfcsNwHS6SE7xqTRyTcyf3TT/YH
 4FgY/ninWNU3WGOHv64cfqgsdPthIGXDnOYDx9i0jeu3Kt1US2IGLgLk5ffs1KY=
X-Google-Smtp-Source: AGHT+IHBmbfM9O9ARExkpU9bIKavBiSK4W/Jp563MrmrJiE+AksYkKIOl96ws7ZKt4oJVaRWoyN41w==
X-Received: by 2002:a05:622a:1c06:b0:458:4bf1:1f46 with SMTP id
 d75a77b69052e-460584f2a14mr288154691cf.53.1729093556249; 
 Wed, 16 Oct 2024 08:45:56 -0700 (PDT)
Received: from ziepe.ca
 (hlfxns017vw-142-68-128-5.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [142.68.128.5]) by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-4609784bfe1sm3525541cf.0.2024.10.16.08.45.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Oct 2024 08:45:55 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.95)
 (envelope-from <jgg@ziepe.ca>) id 1t16Dj-000Cg0-BG;
 Wed, 16 Oct 2024 12:45:55 -0300
Date: Wed, 16 Oct 2024 12:45:55 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Alistair Popple <apopple@nvidia.com>
Cc: Yonatan Maman <ymaman@nvidia.com>, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-rdma@vger.kernel.org,
 linux-mm@kvack.org, herbst@redhat.com, lyude@redhat.com,
 dakr@redhat.com, airlied@gmail.com, simona@ffwll.ch,
 leon@kernel.org, jglisse@redhat.com, akpm@linux-foundation.org,
 dri-devel@lists.freedesktop.org, bskeggs@nvidia.com,
 Gal Shalom <GalShalom@nvidia.com>
Subject: Re: [PATCH v1 1/4] mm/hmm: HMM API for P2P DMA to device zone pages
Message-ID: <20241016154555.GE4020792@ziepe.ca>
References: <20241015152348.3055360-1-ymaman@nvidia.com>
 <20241015152348.3055360-2-ymaman@nvidia.com>
 <87frow8wdk.fsf@nvdebian.thelocal>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87frow8wdk.fsf@nvdebian.thelocal>
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
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On Wed, Oct 16, 2024 at 04:10:53PM +1100, Alistair Popple wrote:
> On that note how is the refcounting of the returned p2pdma page expected
> to work? We don't want the driver calling hmm_range_fault() to be able
> to pin the page with eg. get_page(), so the returned p2pdma page should
> have a zero refcount to enforce that.

I think that is just the rule for hmm stuff in general, don't touch
the refcount.

We don't need to enforce, it we don't know what else the driver will
want to use that P2P page for after all. It might stick it in a VMA
for some unrelated reason.

Jason
