Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B012878EBCD
	for <lists+nouveau@lfdr.de>; Thu, 31 Aug 2023 13:18:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B1F510E629;
	Thu, 31 Aug 2023 11:18:11 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F1EDF10E625
 for <nouveau@lists.freedesktop.org>; Thu, 31 Aug 2023 11:18:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1693480688;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ImdTCX0qhMbLQY/fAtue/3pia3pOfc+fp2ilhRu/fyI=;
 b=hDOyvCeO+HOSXD3kjdEI1OIIPMGaDYiZKox0xTCrmM8vjN2o0pJx3nrXaYj0T2k/vzGNpI
 5l3qXxpjkwnRWNIvKeeVUN4jRiKhASqGwkXNRQQ/YyTcrtAdSTKUex6mwOryIuZTZWUas2
 tE2DeMdwT1lC6W0InSt2YbQJkXVFb6M=
Received: from mail-lj1-f198.google.com (mail-lj1-f198.google.com
 [209.85.208.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-505-BIA9Y9bfOIGZr3gkFfCOjw-1; Thu, 31 Aug 2023 07:18:06 -0400
X-MC-Unique: BIA9Y9bfOIGZr3gkFfCOjw-1
Received: by mail-lj1-f198.google.com with SMTP id
 38308e7fff4ca-2bce272ebdfso10185191fa.1
 for <nouveau@lists.freedesktop.org>; Thu, 31 Aug 2023 04:18:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693480685; x=1694085485;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ImdTCX0qhMbLQY/fAtue/3pia3pOfc+fp2ilhRu/fyI=;
 b=YT5+/82+pdJryxZXLxLzVsCYLXFQLEu8AYHZ8/BPmMEnzYoD/P+7MxrS80zhmvnZY7
 vyMeqOiq2vhnVyZAGNr1eLt0O7550J+JhXiwLxbPjl+Uh0MkdSLgP1TsWMpY1WAqmjyT
 aSU3a2e5g++1L86LZqwthYDllZL1n8dWLkcnI79dFva80dxHM9dY/MLPt2jU/UBMJ6rG
 1UbT+GHwg2f1/Vwc01GkTJZYKKlmFShAJE2MNxo8vMp1K4Spoux0QZQStDJQzr+t8SsY
 NVnllr2GCbcPeO8pQ1dS/M+vvFLx7CEHkqWGsAI5JO6zB0oVASij5ZhrZIIyM7lV0nQy
 y6fw==
X-Gm-Message-State: AOJu0YzB3PiwCQOROUB+0Zz/fio1FdC/xnTq0NmZm6nbZV+CWRE5hIrG
 FdAvGL0cHb6B27ujUKsbyJbAGWxHk7LbhGUy5pZDK+82ORCnZh8UFbZsN0a4Jo/oqMqX370ZWK2
 6pKVT4YlzHERxKzDlyvWtwJ5rVw==
X-Received: by 2002:a2e:88da:0:b0:2bc:df3f:7140 with SMTP id
 a26-20020a2e88da000000b002bcdf3f7140mr3985784ljk.17.1693480684819; 
 Thu, 31 Aug 2023 04:18:04 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFVxV25TATK0Z5ZyNTbjGdYxHc7vhEaQNkOVjJMAPyBXClESYRTnMfnYuIqFbG6o6EQ+BzehA==
X-Received: by 2002:a2e:88da:0:b0:2bc:df3f:7140 with SMTP id
 a26-20020a2e88da000000b002bcdf3f7140mr3985747ljk.17.1693480684351; 
 Thu, 31 Aug 2023 04:18:04 -0700 (PDT)
Received: from cassiopeiae ([2a02:810d:4b3f:de9c:642:1aff:fe31:a19f])
 by smtp.gmail.com with ESMTPSA id
 ds11-20020a170907724b00b0099bcf9c2ec6sm643791ejc.75.2023.08.31.04.18.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 31 Aug 2023 04:18:03 -0700 (PDT)
Date: Thu, 31 Aug 2023 13:18:00 +0200
From: Danilo Krummrich <dakr@redhat.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m_=28Intel=29?= <thomas_os@shipmail.org>
Message-ID: <ZPB26A0/oLHTmyqk@cassiopeiae>
References: <20230820215320.4187-1-dakr@redhat.com>
 <20230820215320.4187-3-dakr@redhat.com>
 <0c50ff22-0f11-1e27-c32e-694ce2b1e6c5@shipmail.org>
 <ZO864yp3UyVEfEjz@pollux>
 <88c45fe6-0942-707c-9ea7-8486c177fcd7@shipmail.org>
 <ZO9Zq2RhbX8EeHrn@pollux>
 <736b6b6d-9e04-a27d-7d60-0c45d696b304@shipmail.org>
MIME-Version: 1.0
In-Reply-To: <736b6b6d-9e04-a27d-7d60-0c45d696b304@shipmail.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
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
 sarah.walker@imgtec.com, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Liam.Howlett@oracle.com, boris.brezillon@collabora.com,
 donald.robson@imgtec.com, daniel@ffwll.ch, christian.koenig@amd.com,
 faith.ekstrand@collabora.com, bskeggs@redhat.com
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On Thu, Aug 31, 2023 at 11:04:06AM +0200, Thomas Hellstr�m (Intel) wrote:
> Hi!
> 
> On 8/30/23 17:00, Danilo Krummrich wrote:
> > On Wed, Aug 30, 2023 at 03:42:08PM +0200, Thomas Hellstr�m (Intel) wrote:
> > > On 8/30/23 14:49, Danilo Krummrich wrote:
> > > > Hi Thomas,
> > > > 
> > > > thanks for having a look!
> > > > 
> > > > On Wed, Aug 30, 2023 at 09:27:45AM +0200, Thomas Hellstr�m (Intel) wrote:
> > > > > Hi, Danilo.
> > > > > 
> > > > > Some quick comments since I'm doing some Xe work in this area. Will probably
> > > > > get back with more.
> > > > > 
> > > > > On 8/20/23 23:53, Danilo Krummrich wrote:

<snip>

> > > > > > diff --git a/include/drm/drm_gpuva_mgr.h b/include/drm/drm_gpuva_mgr.h
> > > > > > index ed8d50200cc3..693e2da3f425 100644
> > > > > > --- a/include/drm/drm_gpuva_mgr.h
> > > > > > +++ b/include/drm/drm_gpuva_mgr.h
> > > > > > @@ -26,12 +26,16 @@
> > > > > >      */
> > > > > >     #include <linux/list.h>
> > > > > > +#include <linux/dma-resv.h>
> > > > > > +#include <linux/maple_tree.h>
> > > > > >     #include <linux/rbtree.h>
> > > > > >     #include <linux/types.h>
> > > > > >     #include <drm/drm_gem.h>
> > > > > > +#include <drm/drm_exec.h>
> > > > > >     struct drm_gpuva_manager;
> > > > > > +struct drm_gpuva_gem;
> > > > > >     struct drm_gpuva_fn_ops;
> > > > > >     /**
> > > > > > @@ -140,7 +144,7 @@ struct drm_gpuva {
> > > > > >     int drm_gpuva_insert(struct drm_gpuva_manager *mgr, struct drm_gpuva *va);
> > > > > >     void drm_gpuva_remove(struct drm_gpuva *va);
> > > > > > -void drm_gpuva_link(struct drm_gpuva *va);
> > > > > > +void drm_gpuva_link(struct drm_gpuva *va, struct drm_gpuva_gem *vm_bo);
> > > > > >     void drm_gpuva_unlink(struct drm_gpuva *va);
> > > > > >     struct drm_gpuva *drm_gpuva_find(struct drm_gpuva_manager *mgr,
> > > > > > @@ -240,15 +244,137 @@ struct drm_gpuva_manager {
> > > > > >     	 * @ops: &drm_gpuva_fn_ops providing the split/merge steps to drivers
> > > > > >     	 */
> > > > > >     	const struct drm_gpuva_fn_ops *ops;
> > > > > > +
> > > > > > +	/**
> > > > > > +	 * @d_obj: Dummy GEM object; used internally to pass the GPU VMs
> > > > > > +	 * dma-resv to &drm_exec.
> > > > > > +	 */
> > > > > > +	struct drm_gem_object d_obj;
> > > > > > +
> > > > > > +	/**
> > > > > > +	 * @resv: the &dma_resv for &drm_gem_objects mapped in this GPU VA
> > > > > > +	 * space
> > > > > > +	 */
> > > > > > +	struct dma_resv *resv;
> > > > > > +
> > > > > > +	/**
> > > > > > +	 * @exec: the &drm_exec helper to lock external &drm_gem_objects
> > > > > > +	 */
> > > > > > +	struct drm_exec exec;
> > > > > > +
> > > > > > +	/**
> > > > > > +	 * @mt_ext: &maple_tree storing external &drm_gem_objects
> > > > > > +	 */
> > > > > > +	struct maple_tree mt_ext;
> > > > > Why are you using a maple tree here? Insertion and removal is O(log(n))
> > > > > instead of O(1) for a list?
> > > > > 
> > > > Having a list of drm_gem_objects directly wouldn't work, as multiple GPU-VMs
> > > > could have mappings of the same extobj.
> > > > 
> > > > I considered using the VM_BO abstraction (struct drm_gpuva_gem) as list entry
> > > > instead, which also seems to be the obvious choice. However, there is a locking
> > > > conflict.
> > > > 
> > > > A drm_gem_object keeps a list of drm_gpuva_gems, while each drm_gpuva_gem keeps
> > > > a list of drm_gpuvas. Both lists are either protected with the dma-resv lock of
> > > > the corresponding drm_gem_object, or with an external lock provided by the
> > > > driver (see drm_gem_gpuva_set_lock()). The latter is used by drivers performing
> > > > changes on the GPUVA space directly from the fence signalling path.
> > > > 
> > > > Now, similar to what drm_gpuva_link() and drm_gpuva_unlink() are doing already,
> > > > we'd want to add a drm_gpuva_gem to the extobj list for the first mapping being
> > > > linked and we'd want to remove it for the last one being unlinked.
> > > > 
> > > > (Actually we'd want to add the drm_gpuva_gem object to the extobj list even
> > > > before, because otherwise we'd not acquire it's dma-resv lock of this GEM object
> > > > through drm_gpuva_manager_lock(). But that's trival, we could do that when we
> > > > create the drm_gpuva_gem, which we need to do anyways.)
> > > > 
> > > > Anyway, we'd probably want to keep removing the drm_gpuva_gem from the extobj
> > > > list from drm_gpuva_unlink() when the last mapping of this BO is unlinked. In
> > > > order to do so, we'd (as discussed above) either need to hold the outer GPU-VM
> > > > lock or the GPU-VMs dma-resv lock. Both would be illegal in the case
> > > > drm_gpuva_unlink() is called from within the fence signalling path. For drivers
> > > > like XE or Nouveau, we'd at least need to make sure to not mess up the locking
> > > > hierarchy of GPU-VM lock and dma-resv lock of the corresponding BO.
> > > > 
> > > > Considering all that, I thought it's probably better to track extobjs separate
> > > > from the drm_gpuva_gem, hence the maple tree choice.
> > > Hm. OK, in Xe we're having a list of the xe_vmas (drm_gpuvas) that point to
> > > external objects, or in the case of multiple mappings to the same gem
> > > object, only one of the drm_gpuvas is in the list. These are protected by
> > > the GPU-VM lock. I don't see a problem with removing those from the fence
> > > signalling path, though?
> > I intentionally tried to avoid keeping a list of drm_gpuvas to track extobjs,
> > since this is generic code I don't know how much mappings of an external object
> > the corresponding driver potentially creates. This could become a pretty large
> > list to iterate. Another reason was, that I want to keep the drm_gpuva structure
> > as small as possible, hence avoiding another list_head.
> 
> Yes, the list might be pretty large, but OTOH you never iterate to access a
> single list element. When you need to iterate the whole list you need to do
> that regardless of the data structure used. As for the list head, it might
> perhaps be aliased (union) with an upcoming userptr list head?
> 

Oh, I did not mean that I'm concerned about the size of a list of extobjs in
general, that would indeed be the same for every data structure chosen. But I
would be concerned about keeping a list of *all* mappings being backed by an
extobj.

> > 
> > Now, it sounds like in XE you're doing some kind of optimization just keeping a
> > single mapping of an extobj in the list? How do you know when to remove it? What
> > if the mapping from the extobj list gets unmapped, but there is still another
> > one left in the GPU-VM being backed by the same BO?
> When removing from the lists, we iterate through the object's list of vmas,
> and if there is one matching the same vm, we replace the old one with the
> new one. A similar iteration is done when adding to avoid adding one that is
> already on the list.

I see, but wouldn't this be O(n) on insertion and O(m) on removal of an extobj,
while using the maple tree is O(log(n))?

> > Although assuming that's a no-go for GPUVA wouldn't an XArray be a better
> > choice, keeping O(1)?
> > When tracking extobjs, the address of the drm_gem_object is the key while the
> > reference count is the value. I was thinking of an XArray as well, but I was
> > worried that the corresponding indices could be too much distributed for an
> > XArray to still be efficient. Now that I think about it, it's probably not that
> > bad.
> > 
> > Btw., while I agree trying to make things as efficient as possible, what is the
> > magnitue for extobjs to be tracked, do we need to worry about the O(log(n))?
> 
> Not sure yet, TBH, but I think one of our UMDs can only use external object,
> because they don't know at creation time which ones need exporting. However
> if this turns out to be too bad, there are various flavours of "clever but
> complicated" optimizations that we could think of to reduce the list size.
> Still in our case, we opted for the vma list head for now.

Considering the above, I would guess that if your current approach is good
enough, a maple tree will work as well.

Otherwise, if you want, I could do some experiments with Xarray and see how
that works out compared to using a maple tree.

Btw. another nice thing about using Xarray or maple tree for that is that
drivers updating the VA space from the fence signalling path don't need to
hold a GPU-VM lock to update the extobj list. Actually, they might not need
a GPU-VM lock at all.

> 
> /Thomas
> 
> 
> > 
> > > > > > +
> > > > > > +	/**
> > > > > > +	 * @evict: structure holding the evict list and evict list lock
> > > > > > +	 */
> > > > > > +	struct {
> > > > > > +		/**
> > > > > > +		 * @list: &list_head storing &drm_gem_objects currently being
> > > > > > +		 * evicted
> > > > > > +		 */
> > > > > > +		struct list_head list;
> > > > > > +
> > > > > > +		/**
> > > > > > +		 * @lock: spinlock to protect the evict list against concurrent
> > > > > > +		 * insertion / removal of different &drm_gpuva_gems
> > > > > > +		 */
> > > > > > +		spinlock_t lock;
> > > > > > +	} evict;
> > > > > >     };
> > > > > >     void drm_gpuva_manager_init(struct drm_gpuva_manager *mgr,
> > > > > > +			    struct drm_device *drm,
> > > > > >     			    const char *name,
> > > > > >     			    u64 start_offset, u64 range,
> > > > > >     			    u64 reserve_offset, u64 reserve_range,
> > > > > >     			    const struct drm_gpuva_fn_ops *ops);
> > > > > >     void drm_gpuva_manager_destroy(struct drm_gpuva_manager *mgr);
> > > > > > +/**
> > > > > > + * DRM_GPUVA_EXEC - returns the &drm_gpuva_managers &drm_exec instance
> > > > > > + * @mgr: the &drm_gpuva_managers to return the &drm_exec instance for
> > > > > > + */
> > > > > > +#define DRM_GPUVA_EXEC(mgr)	&(mgr)->exec
> > > > > A struct ww_acquire_ctx and thus a drm_exec is fundamentally per task and
> > > > > should typically be allocated on the stack. Otherwise you'd need to protect
> > > > > the mgr->exec member with an exclusive lock throughout the locking process,
> > > > > and that's not what we want.
> > > > Oh, good point. I think it works in Nouveau, because there it's implicitly
> > > > protected with the job submission lock.
> > > > 
> > > > > Did you consider subclassing a drm_exec for drm_gpuva purposes and add
> > > > > needed ops to it: Like so:
> > > > That's a good idea, will take this into V2.
> > > Actually, I'm not fully sure that was a good idea: I've now have a working
> > > version of Xe ported over to drm_exec, having these helpers in mind and with
> > > the intention to start using them as they mature. What I found, though is
> > > that open-coding the drm_exec loop is not all that bad, but that building
> > > blocks that can be called from within the loop are useful:
> > > 
> > > Like the drm_gpuva_prepare_objects() and an imaginary
> > > drm_gpuva_prepare_gpuva() that locks the vm resv and the resv of the object
> > > (if different and the gpuva points to the object. And
> > > drm_gpuva_prepare_array() although we don't use it within Xe. That means you
> > > can use these building blocks like helpers and avoid the fn() callback by
> > > instead open-coding.
> > > 
> > > But I guess YMMV.
> > That's exactly why those building blocks are exported, I already had in mind
> > that there might be drivers which still want to open-code the drm_exec loop,
> > while others might just want a simple interface to lock everything.
> > 
> > I still think it is a good idea, but I'd keep that as simple as possible. And
> > for everything else just let the driver open-code it and use the "building
> > blocks" - will also expand the bulding blocks to what you mentioned above.
> > 
> > > > > struct drm_gpuva_exec_ops {
> > > > >   ��� int (*fn) (struct drm_gpuva_exec *exec, int num_fences);
> > > > Is this the fn argument from drm_gpuva_manager_lock_extra()?
> > > > 
> > > > >   ��� int (*bo_validate) (struct drm_gpuva_exec *exec, struct drm_gem_object
> > > > > *obj);
> > > > I guess we could also keep that within the drm_gpuva_fn_ops? This should always
> > > > be the same callback, right?
> > > > 
> > > > > };
> > > > > 
> > > > > struct drm_gpuva_exec {
> > > > >   ��� const struct drm_gpuva_exec_ops *ops;
> > > > >   ��� struct drm_exec exec;
> > > > >   ��� struct drm_gpuva_manager *mgr;
> > > > > };
> > > > > 
> > > > > Although I'd actually expect bo_validate to be part of fn in the typical
> > > > > case. The drm_gpuva_exec would then be allocated by the caller on the stack.
> > > > This doesn't sound like my assumption about fn() above is correct.
> > > Well one important thing in our conversion is that ttm_bo_validate () needs
> > > to be in the until_all_locked() loop. We want to be able soon to use
> > > sleeping locks for eviction, so a xe_bo_validate() would, at least
> > > temporarily, add locked objects to the drm_exec list of locked objects. That
> > > means everything that may end up calling validate deep within the call chain
> > > needs to be part of the until_all_locked() loop, so our
> > > drm_gpuva_manager_lock_extra() fn callback would include those validates and
> > > look different all the time. Hence that's why open-coding isn't all that
> > > bad...
> > Oh, I see. You indeed want to call validate() from within until_all_locked().
> > 
> > > /Thomas
> > > 
> > > 

<snip>

