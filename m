Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4830C79AA1B
	for <lists+nouveau@lfdr.de>; Mon, 11 Sep 2023 18:23:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3CD0310E328;
	Mon, 11 Sep 2023 16:23:38 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B1E010E328
 for <nouveau@lists.freedesktop.org>; Mon, 11 Sep 2023 16:23:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1694449415;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=zetrdZPONeG9YLHuQzoKZ5HDVObBlNiSzaWhvus5y8s=;
 b=PH8FPLW4uYL+nmIpJBCWGB6htlLKPfvsDPl8HmuLkEZzprU6O4QiwU6Js/CtFdqEWn77Vp
 zFX3EtpqEck9IVWbbBw1lZN9DMn9EjwC+rTx5G+B2n/Yv02orKd8vEDZNWGB8TPGZv7seK
 fPmTTEj2+UjcgiK9TibfeaQqQ27Cwoc=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-74-aWBFlpsHN1CmtY2tHpI8KQ-1; Mon, 11 Sep 2023 12:23:33 -0400
X-MC-Unique: aWBFlpsHN1CmtY2tHpI8KQ-1
Received: by mail-ej1-f70.google.com with SMTP id
 a640c23a62f3a-9ad73eb9668so73628666b.0
 for <nouveau@lists.freedesktop.org>; Mon, 11 Sep 2023 09:23:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694449412; x=1695054212;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zetrdZPONeG9YLHuQzoKZ5HDVObBlNiSzaWhvus5y8s=;
 b=xJn+ROl1V9Ca1ljb8LOmKABO7JSQHKTjkKnP8HSIpxReeiCnE1+s0FlwCF7HIJ7Blz
 kBYAM1Vdhvd5SYwM7RkaIM4q9vPskSOUjKDG1cbjYfrjKt8sb2fNpCPd/ErvhaHZnjIh
 ONMxLe8UmACbWjdOgU5h4cvNKioFo9kzMDPHW2RslSgV/N4hQWdmkoE7YEUWXhszn1Wb
 eKYwtuKTaLGEi2Do0Xg5live6j8t1SWsgbK1j+tEyOOGz/+tPLy5SLzFYXrKkjeQZes+
 +3C+MxK6bI4zqoV5SUFYUPbFBB+KQ+PA1mAqg1lLL0yeysQcyzQ42jVjcK8TqK+S9nyA
 Tueg==
X-Gm-Message-State: AOJu0Yy7/Hg5/i/yR3b7FwB5dMPC1vLPK43LaBtRBHqVIbfq+09EiJow
 Pkqr/KWVg1tDjwkvIGcCi7s4NXpHNOiTROBQ8LgABLwnPJK8D/2gTIsNunH0nqHgtTuMNlbPc40
 gWMBRy4BohmnGGDfdVgJnpCp8pfYfsi2PTA==
X-Received: by 2002:a17:907:75d6:b0:9a5:a543:2744 with SMTP id
 jl22-20020a17090775d600b009a5a5432744mr126861ejc.33.1694449411597; 
 Mon, 11 Sep 2023 09:23:31 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG6VUL0cDAfKiEJclPyM0psTdVvLtqVKNpq4PjGwwT80miyhI3PvRW23DdYuYlfXDJJgNat4Q==
X-Received: by 2002:a17:907:75d6:b0:9a5:a543:2744 with SMTP id
 jl22-20020a17090775d600b009a5a5432744mr126835ejc.33.1694449411248; 
 Mon, 11 Sep 2023 09:23:31 -0700 (PDT)
Received: from cassiopeiae ([2a02:810d:4b3f:de9c:642:1aff:fe31:a19f])
 by smtp.gmail.com with ESMTPSA id
 e10-20020a170906044a00b0099d0a8ccb5fsm5610916eja.152.2023.09.11.09.23.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Sep 2023 09:23:29 -0700 (PDT)
Date: Mon, 11 Sep 2023 18:23:26 +0200
From: Danilo Krummrich <dakr@redhat.com>
To: Boris Brezillon <boris.brezillon@collabora.com>
Message-ID: <ZP8+/gjvKFBGR/Y4@cassiopeiae>
References: <20230909153125.30032-1-dakr@redhat.com>
 <20230909153125.30032-7-dakr@redhat.com>
 <20230911123526.6c67feb0@collabora.com>
MIME-Version: 1.0
In-Reply-To: <20230911123526.6c67feb0@collabora.com>
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

On Mon, Sep 11, 2023 at 12:35:26PM +0200, Boris Brezillon wrote:
> Hello Danilo,
> 
> On Sat,  9 Sep 2023 17:31:13 +0200
> Danilo Krummrich <dakr@redhat.com> wrote:
> 
> 
> > @@ -632,6 +661,131 @@
> >   *	}
> >   */
> >  
> > +/**
> > + * get_next_vm_bo_from_list() - get the next vm_bo element
> > + * @__gpuvm: The GPU VM
> > + * @__list_name: The name of the list we're iterating on
> > + * @__local_list: A pointer to the local list used to store already iterated items
> > + * @__prev_vm_bo: The previous element we got from drm_gpuvm_get_next_cached_vm_bo()
> > + *
> > + * This helper is here to provide lockless list iteration. Lockless as in, the
> > + * iterator releases the lock immediately after picking the first element from
> > + * the list, so list insertion deletion can happen concurrently.
> > + *
> > + * Elements popped from the original list are kept in a local list, so removal
> > + * and is_empty checks can still happen while we're iterating the list.
> > + */
> > +#define get_next_vm_bo_from_list(__gpuvm, __list_name, __local_list, __prev_vm_bo)	\
> > +	({										\
> > +		struct drm_gpuvm_bo *__vm_bo;						\
> > +											\
> > +		drm_gpuvm_bo_put(__prev_vm_bo);						\
> > +											\
> > +		spin_lock(&(__gpuvm)->__list_name.lock);				\
> 
> I'm tempted to add a drm_gpuvm::<list_name>::local_list field, so we
> can catch concurrent iterations with something like:
> 
> 		if (!(__gpuvm)->__list_name.local_list)
> 			(__gpuvm)->__list_name.local_list = __local_list;
> 		else
> 			WARN_ON((__gpuvm)->__list_name.local_list != __local_list);
> 
> with (__gpuvm)->__list_name.local_list being restored to NULL
> in restore_vm_bo_list().
> 
> > +		while (!list_empty(&(__gpuvm)->__list_name.list)) {			\
> > +			__vm_bo = list_first_entry(&(__gpuvm)->__list_name.list,	\
> > +						   struct drm_gpuvm_bo,			\
> > +						   list.entry.__list_name);		\
> > +			if (drm_gpuvm_bo_get_unless_zero(__vm_bo)) {			\
> > +				list_move_tail(&(__vm_bo)->list.entry.__list_name,	\
> > +					       __local_list);				\
> > +				break;							\
> > +			} else {							\
> > +				list_del_init(&(__vm_bo)->list.entry.__list_name);	\
> > +				__vm_bo = NULL;						\
> > +			}								\
> > +		}									\
> > +		spin_unlock(&(__gpuvm)->__list_name.lock);				\
> > +											\
> > +		__vm_bo;								\
> > +	})
> > +
> > +/**
> > + * for_each_vm_bo_in_list() - internal vm_bo list iterator
> > + *
> > + * This helper is here to provide lockless list iteration. Lockless as in, the
> > + * iterator releases the lock immediately after picking the first element from the
> > + * list, so list insertion and deletion can happen concurrently.
> > + *
> > + * Typical use:
> > + *
> > + *	struct drm_gpuvm_bo *vm_bo;
> > + *	LIST_HEAD(my_local_list);
> > + *
> > + *	ret = 0;
> > + *	drm_gpuvm_for_each_vm_bo(gpuvm, <list_name>, &my_local_list, vm_bo) {
> > + *		ret = do_something_with_vm_bo(..., vm_bo);
> > + *		if (ret)
> > + *			break;
> > + *	}
> > + *	drm_gpuvm_bo_put(vm_bo);
> > + *	drm_gpuvm_restore_vm_bo_list(gpuvm, <list_name>, &my_local_list);
> 
> The names in this example and the helper names don't match.
> 
> > + *
> > + *
> > + * Only used for internal list iterations, not meant to be exposed to the outside
> > + * world.
> > + */
> > +#define for_each_vm_bo_in_list(__gpuvm, __list_name, __local_list, __vm_bo)	\
> > +	for (__vm_bo = get_next_vm_bo_from_list(__gpuvm, __list_name,		\
> > +						__local_list, NULL);		\
> > +	     __vm_bo;								\
> > +	     __vm_bo = get_next_vm_bo_from_list(__gpuvm, __list_name,		\
> > +						__local_list, __vm_bo))		\
> > +
> > +/**
> > + * restore_vm_bo_list() - move vm_bo elements back to their original list
> > + * @__gpuvm: The GPU VM
> > + * @__list_name: The name of the list we're iterating on
> > + * @__local_list: A pointer to the local list used to store already iterated items
> > + *
> > + * When we're done iterating a vm_bo list, we should call restore_vm_bo_list()
> > + * to restore the original state and let new iterations take place.
> > + */
> > +#define restore_vm_bo_list(__gpuvm, __list_name, __local_list)				\
> > +	do {										\
> > +		/* Merge back the two lists, moving local list elements to the		\
> > +		 * head to preserve previous ordering, in case it matters.		\
> > +		 */									\
> > +		spin_lock(&(__gpuvm)->__list_name.lock);				\
> > +		list_splice(__local_list, &(__gpuvm)->__list_name.list);		\
> > +		spin_unlock(&(__gpuvm)->__list_name.lock);				\
> > +	} while (0)
> > +/**
> > + * drm_gpuvm_bo_list_add() - insert a vm_bo into the given list
> > + * @__vm_bo: the &drm_gpuvm_bo
> > + * @__list_name: the name of the list to insert into
> > + *
> > + * Inserts the given @__vm_bo into the list specified by @__list_name and
> > + * increases the vm_bo's reference count.
> > + */
> > +#define drm_gpuvm_bo_list_add(__vm_bo, __list_name)				\
> > +	do {									\
> > +		spin_lock(&(__vm_bo)->vm->__list_name.lock);			\
> > +		if (list_empty(&(__vm_bo)->list.entry.__list_name))		\
> > +			list_add_tail(&(__vm_bo)->list.entry.__list_name,	\
> > +				      &(__vm_bo)->vm->__list_name.list);	\
> > +		spin_unlock(&(__vm_bo)->vm->__list_name.lock);			\
> > +	} while (0)
> > +
> > +/**
> > + * drm_gpuvm_bo_list_del() - remove a vm_bo from the given list
> > + * @__vm_bo: the &drm_gpuvm_bo
> > + * @__list_name: the name of the list to insert into
> > + *
> > + * Removes the given @__vm_bo from the list specified by @__list_name and
> > + * decreases the vm_bo's reference count.
> > + */
> > +#define drm_gpuvm_bo_list_del(__vm_bo, __list_name)				\
> > +	do {									\
> > +		spin_lock(&(__vm_bo)->vm->__list_name.lock);			\
> > +		if (!list_empty(&(__vm_bo)->list.entry.__list_name))		\
> > +			list_del_init(&(__vm_bo)->list.entry.__list_name);	\
> > +		spin_unlock(&(__vm_bo)->vm->__list_name.lock);			\
> > +	} while (0)
> > +
> > +static int __must_check
> > +drm_gpuvm_bo_get_unless_zero(struct drm_gpuvm_bo *vm_bo);
> 
> I see no obvious reason to have a forward declaration for this helper,
> if we decide to keep it, let's at least move the declaration here.
> 
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
> > @@ -822,6 +1285,11 @@ drm_gpuvm_bo_destroy(struct kref *kref)
> >   * @vm_bo: the &drm_gpuvm_bo to release the reference of
> >   *
> >   * This releases a reference to @vm_bo.
> > + *
> > + * If the reference count drops to zero, the &gpuvm_bo is destroyed, which
> > + * includes removing it from the GEMs gpuva list. Hence, if a call to this
> > + * function can potentially let the reference count to zero the caller must
> > + * hold the dma-resv or driver specific GEM gpuva lock.
> 
> Looks like this should have been part of the previous patch. I hate
> the fact we have to worry about GEM gpuva lock being held when we call
> _put() only if the ref drops to zero though. I think I'd feel more
> comfortable if the function was named differently. Maybe _return() or
> _release() to match the _obtain() function, where the object is inserted
> in the GEM vm_bo list. I would also do the lock_is_held() check
> unconditionally, move the list removal in this function with a del_init(),
> and have a WARN_ON(!list_empty) in vm_bo_destroy().
> 

We can't move the list removal to drm_gpuvm_bo_put(), we need to make sure we
can't create duplicate drm_gpuvm_bo structures. Everything else pretty much goes
away with a dedicated GEM gpuva list lock, as I had in my first patch series
when I introduced the GPUVA manager. At that time it wasn't always needed, hence
the optional driver specific lock, however with the VM_BO abstraction it really
makes sense to have a dedicated one.


I agree with the other feedback from this reply and will address it in a V4.

> >   */
> >  void
> >  drm_gpuvm_bo_put(struct drm_gpuvm_bo *vm_bo)
> > @@ -831,6 +1299,12 @@ drm_gpuvm_bo_put(struct drm_gpuvm_bo *vm_bo)
> >  }
> >  EXPORT_SYMBOL_GPL(drm_gpuvm_bo_put);
> >  
> > +static int __must_check
> > +drm_gpuvm_bo_get_unless_zero(struct drm_gpuvm_bo *vm_bo)
> > +{
> > +	return kref_get_unless_zero(&vm_bo->kref);
> 
> Not convinced this helper is needed. It's only used once, and I
> don't think we'll need it elsewhere.
> 
> > +}
> > +
> >  static struct drm_gpuvm_bo *
> >  __drm_gpuvm_bo_find(struct drm_gpuvm *gpuvm,
> >  		    struct drm_gem_object *obj)
> 
> 
> Regards,
> 
> Boris
> 

