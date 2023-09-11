Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C36179AA21
	for <lists+nouveau@lfdr.de>; Mon, 11 Sep 2023 18:30:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9AD3110E338;
	Mon, 11 Sep 2023 16:30:18 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A95210E338
 for <nouveau@lists.freedesktop.org>; Mon, 11 Sep 2023 16:30:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1694449816;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=RnHJHN5Cfj592B1txIAsnJFDj1FO7IjqCo2I3g3K4yE=;
 b=iMYs9f0tBk8L0mtfEs92zj/d4zkNoWucwae951Wq2DyWQkwMX0o6kGOZlv7Jw7bRTI6IqC
 raeK2PQvYVDIz7IqRYXfRO4saoRxAW630llyZvAkLklYs31nYFFOl3wN+Yas9ZnY/8aHGQ
 5ZhD+UOJ3gr1UILSGolWiAMVvfLRHQc=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-688-6mTamxnfM3yhvoFL8a2JKA-1; Mon, 11 Sep 2023 12:30:15 -0400
X-MC-Unique: 6mTamxnfM3yhvoFL8a2JKA-1
Received: by mail-ej1-f70.google.com with SMTP id
 a640c23a62f3a-9aa05c1934aso367833966b.1
 for <nouveau@lists.freedesktop.org>; Mon, 11 Sep 2023 09:30:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694449814; x=1695054614;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=RnHJHN5Cfj592B1txIAsnJFDj1FO7IjqCo2I3g3K4yE=;
 b=j3QnV8LC6fCLgTpM+FmMoPGPGziURJcQpuJtyXtvKjQ/lgu87kL7AG3Zwu/t8BArS3
 Skr58oYZ2dULxT4D4lt+L9HLO3wRtHcyWMm2xu39xHiF3nDaKIl5BbR3/nGNGIic1oOk
 BpSnP2t/WAtR8Vn0phmO0gOCWGqxm29+q7gNy3AQIL/X7MUNqhuKg9UcYCJC8cq09WNt
 o6hQ2nfdcEH0v7/RwD8QJlo3HCnb2sAJQoV0Ef6F1i2kWgRVL214fPtJEpoYuqfTz/q9
 73RhZ5zdPseZkR9e6qXvbMlWjFy12YT1fsaETb7uvcT08VUUNMNCSz5jNyThUY4TK1Ef
 +O1w==
X-Gm-Message-State: AOJu0YxRQSwpSQqt0zl4pTs8w5BqBYqKYUGI4OJeZPqcoiQi3FJK4Yrr
 nd44II3Ni81HxOVwf0QgAHSA5Wv1gXu018iPhD9EMIaPE0Rw7NBW/xcqEr0QikGk5LZUtcX+t/A
 xldtrWM+dOBRbcxmopIgQ667HAg==
X-Received: by 2002:a17:907:8a1c:b0:982:a022:a540 with SMTP id
 sc28-20020a1709078a1c00b00982a022a540mr206933ejc.11.1694449813785; 
 Mon, 11 Sep 2023 09:30:13 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHNhPmNNStTZs5PE2OQ6KZzdKOTE5Av9U7Sptz++UFQy/HCfVuMVhM7hDiKm6FA6tPHtenKgA==
X-Received: by 2002:a17:907:8a1c:b0:982:a022:a540 with SMTP id
 sc28-20020a1709078a1c00b00982a022a540mr206903ejc.11.1694449813470; 
 Mon, 11 Sep 2023 09:30:13 -0700 (PDT)
Received: from cassiopeiae ([2a02:810d:4b3f:de9c:642:1aff:fe31:a19f])
 by smtp.gmail.com with ESMTPSA id
 f5-20020a170906138500b0099cb1a2cab0sm5590017ejc.28.2023.09.11.09.30.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Sep 2023 09:30:12 -0700 (PDT)
Date: Mon, 11 Sep 2023 18:30:10 +0200
From: Danilo Krummrich <dakr@redhat.com>
To: Boris Brezillon <boris.brezillon@collabora.com>
Message-ID: <ZP9AkkJ1FruZGSVV@cassiopeiae>
References: <20230909153125.30032-1-dakr@redhat.com>
 <20230909153125.30032-7-dakr@redhat.com>
 <20230911164526.0192a686@collabora.com>
MIME-Version: 1.0
In-Reply-To: <20230911164526.0192a686@collabora.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Subject: Re: [Nouveau] [PATCH drm-misc-next v3 6/7] drm/gpuvm: generalize
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
 sarah.walker@imgtec.com, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 donald.robson@imgtec.com, daniel@ffwll.ch, christian.koenig@amd.com,
 faith.ekstrand@collabora.com
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On Mon, Sep 11, 2023 at 04:45:26PM +0200, Boris Brezillon wrote:
> On Sat,  9 Sep 2023 17:31:13 +0200
> Danilo Krummrich <dakr@redhat.com> wrote:
> 
> > @@ -807,6 +1262,14 @@ drm_gpuvm_bo_destroy(struct kref *kref)
> >  
> >  	drm_gem_gpuva_assert_lock_held(vm_bo->obj);
> >  
> > +	spin_lock(&gpuvm->extobj.lock);
> > +	list_del(&vm_bo->list.entry.extobj);
> > +	spin_unlock(&gpuvm->extobj.lock);
> > +
> > +	spin_lock(&gpuvm->evict.lock);
> > +	list_del(&vm_bo->list.entry.evict);
> > +	spin_unlock(&gpuvm->evict.lock);
> > +
> >  	list_del(&vm_bo->list.entry.gem);
> >  
> >  	drm_gem_object_put(obj);
> 
> I ran into a UAF situation when the drm_gpuvm_bo object is the last
> owner of obj, because the lock that's supposed to be held when calling
> this function (drm_gem_gpuva_assert_lock_held() call above), belongs to
> obj (either obj->resv, or a driver specific lock that's attached to the
> driver-specific GEM object). I worked around it by taking a ref to obj
> before calling lock()+drm_gpuvm_bo_put()+unlock(), and releasing it
> after I'm node with the lock, but that just feels wrong.
> 
As mentioned in a previous reply, I think we want to bring the dedicated GEM
gpuva list lock back instead of abusing the dma-resv lock. This way we can
handle locking internally and don't run into such issues.

There is also no reason for a driver to already hold the GEM gpuva list lock
when when calling drm_gpuvm_bo_put(). Drivers would only acquire the lock to
iterate the GEMs list of drm_gpuvm_bos or the drm_gpuvm_bos list of drm_gpuvas.
And dropping the drm_gpuvm_bo from within such a loop is forbidden anyways.

