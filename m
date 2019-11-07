Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A6E912B32B
	for <lists+nouveau@lfdr.de>; Fri, 27 Dec 2019 09:16:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 41DF16E3AA;
	Fri, 27 Dec 2019 08:14:39 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F0E96EE66
 for <nouveau@lists.freedesktop.org>; Thu,  7 Nov 2019 02:08:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1573092500;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3pEC4ofbH9GmBg4Hvo6IdX7Sd6lzjmsN2FQ75gU3Q+g=;
 b=a9csM+XnEOWcmFZyPqDkd6JsfS4P3nA5dQEcCTCMlId/XJi0a93YJEVJpnND3vWT/NTij4
 m4VUWxr/AFL2X+1jjItewD6THtHvzX74gH4ZoL/R7r+SkOH8wiq341xIiDnyUxvHMcAUG1
 DX1wl0kZPZ+P789j7NpEZrh1nDgQ6ig=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-251-vYaKpkspMBqRrJUS4jgCJw-1; Wed, 06 Nov 2019 21:08:16 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8F5831005502;
 Thu,  7 Nov 2019 02:08:13 +0000 (UTC)
Received: from redhat.com (ovpn-125-216.rdu2.redhat.com [10.10.125.216])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 04F095C299;
 Thu,  7 Nov 2019 02:08:09 +0000 (UTC)
Date: Wed, 6 Nov 2019 21:08:07 -0500
From: Jerome Glisse <jglisse@redhat.com>
To: John Hubbard <jhubbard@nvidia.com>
Message-ID: <20191107020807.GA747656@redhat.com>
References: <20191028201032.6352-1-jgg@ziepe.ca>
 <20191028201032.6352-3-jgg@ziepe.ca>
 <35c2b322-004e-0e18-87e4-1920dc71bfd5@nvidia.com>
MIME-Version: 1.0
In-Reply-To: <35c2b322-004e-0e18-87e4-1920dc71bfd5@nvidia.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-MC-Unique: vYaKpkspMBqRrJUS4jgCJw-1
X-Mimecast-Spam-Score: 0
Content-Disposition: inline
X-Mailman-Approved-At: Fri, 27 Dec 2019 08:13:32 +0000
Subject: Re: [Nouveau] [PATCH v2 02/15] mm/mmu_notifier: add an interval
 tree notifier
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
Cc: nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Michal Hocko <mhocko@kernel.org>, linux-mm@kvack.org,
 Andrea Arcangeli <aarcange@redhat.com>, David Zhou <David1.Zhou@amd.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
 linux-rdma@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 Christoph Hellwig <hch@infradead.org>, Jason Gunthorpe <jgg@ziepe.ca>,
 Jason Gunthorpe <jgg@mellanox.com>, Ben Skeggs <bskeggs@redhat.com>,
 xen-devel@lists.xenproject.org, Ralph Campbell <rcampbell@nvidia.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>, Petr Cvek <petrcvekcz@gmail.com>,
 Juergen Gross <jgross@suse.com>, Mike Marciniszyn <mike.marciniszyn@intel.com>,
 Dennis Dalessandro <dennis.dalessandro@intel.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, Felix.Kuehling@amd.com
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: quoted-printable
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On Wed, Nov 06, 2019 at 04:23:21PM -0800, John Hubbard wrote:
> On 10/28/19 1:10 PM, Jason Gunthorpe wrote:

[...]

> >  /**
> >   * enum mmu_notifier_event - reason for the mmu notifier callback
> > @@ -32,6 +34,9 @@ struct mmu_notifier_range;
> >   * access flags). User should soft dirty the page in the end callback =
to make
> >   * sure that anyone relying on soft dirtyness catch pages that might b=
e written
> >   * through non CPU mappings.
> > + *
> > + * @MMU_NOTIFY_RELEASE: used during mmu_range_notifier invalidate to s=
ignal that
> > + * the mm refcount is zero and the range is no longer accessible.
> >   */
> >  enum mmu_notifier_event {
> >  	MMU_NOTIFY_UNMAP =3D 0,
> > @@ -39,6 +44,7 @@ enum mmu_notifier_event {
> >  	MMU_NOTIFY_PROTECTION_VMA,
> >  	MMU_NOTIFY_PROTECTION_PAGE,
> >  	MMU_NOTIFY_SOFT_DIRTY,
> > +	MMU_NOTIFY_RELEASE,
> >  };
> =

> =

> OK, let the naming debates begin! ha. Anyway, after careful study of the =
overall
> patch, and some browsing of the larger patchset, it's clear that:
> =

> * The new "MMU range notifier" that you've created is, approximately, a n=
ew
> object. It uses classic mmu notifiers inside, as an implementation detail=
, and
> it does *similar* things (notifications) as mmn's. But it's certainly not=
 the same
> as mmn's, as shown later when you say the need to an entirely new ops str=
uct, and =

> data struct too.
> =

> Therefore, you need a separate events enum as well. This is important. MM=
N's
> won't be issuing MMN_NOTIFY_RELEASE events, nor will MNR's be issuing the=
 first
> four prexisting MMU_NOTIFY_* items. So it would be a design mistake to gl=
om them
> together, unless you ultimately decided to merge these MMN and MNR object=
s (which
> I don't really see any intention of, and that's fine).
> =

> So this should read:
> =

> enum mmu_range_notifier_event {
> 	MMU_NOTIFY_RELEASE,
> };
> =

> ...assuming that we stay with "mmu_range_notifier" as a core name for thi=
s =

> whole thing.
> =

> Also, it is best moved down to be next to the new MNR structs, so that al=
l the
> MNR stuff is in one group.
> =

> Extra credit: IMHO, this clearly deserves to all be in a new mmu_range_no=
tifier.h
> header file, but I know that's extra work. Maybe later as a follow-up pat=
ch,
> if anyone has the time.

The range notifier should get the event too, it would be a waste, i think i=
t is
an oversight here. The release event is fine so NAK to you separate event. =
Event
is really an helper for notifier i had a set of patch for nouveau to levera=
ge
this i need to resucite them. So no need to split thing, i would just forwa=
rd
the event ie add event to mmu_range_notifier_ops.invalidate() i failed to c=
atch
that in v1 sorry.


[...]

> > +struct mmu_range_notifier_ops {
> > +	bool (*invalidate)(struct mmu_range_notifier *mrn,
> > +			   const struct mmu_notifier_range *range,
> > +			   unsigned long cur_seq);
> > +};
> > +
> > +struct mmu_range_notifier {
> > +	struct interval_tree_node interval_tree;
> > +	const struct mmu_range_notifier_ops *ops;
> > +	struct hlist_node deferred_item;
> > +	unsigned long invalidate_seq;
> > +	struct mm_struct *mm;
> > +};
> > +
> =

> Again, now we have the new struct mmu_range_notifier, and the old =

> struct mmu_notifier_range, and it's not good.
> =

> Ideas:
> =

> a) Live with it.
> =

> b) (Discarded, too many callers): rename old one. Nope.
> =

> c) Rename new one. Ideas:
> =

>     struct mmu_interval_notifier
>     struct mmu_range_intersection
>     ...other ideas?

I vote for interval_notifier we do want notifier in name but i am also
fine with current name.

[...]

> > + *
> > + * Note that the core mm creates nested invalidate_range_start()/end()=
 regions
> > + * within the same thread, and runs invalidate_range_start()/end() in =
parallel
> > + * on multiple CPUs. This is designed to not reduce concurrency or blo=
ck
> > + * progress on the mm side.
> > + *
> > + * As a secondary function, holding the full write side also serves to=
 prevent
> > + * writers for the itree, this is an optimization to avoid extra locki=
ng
> > + * during invalidate_range_start/end notifiers.
> > + *
> > + * The write side has two states, fully excluded:
> > + *  - mm->active_invalidate_ranges !=3D 0
> > + *  - mnn->invalidate_seq & 1 =3D=3D True
> > + *  - some range on the mm_struct is being invalidated
> > + *  - the itree is not allowed to change
> > + *
> > + * And partially excluded:
> > + *  - mm->active_invalidate_ranges !=3D 0
> =

> I assume this implies mnn->invalidate_seq & 1 =3D=3D False in this case? =
If so,
> let's say so. I'm probably getting that wrong, too.

Yes (mnn->invalidate_seq & 1) =3D=3D 0

> =

> > + *  - some range on the mm_struct is being invalidated
> > + *  - the itree is allowed to change
> > + *
> > + * The later state avoids some expensive work on inv_end in the common=
 case of
> > + * no mrn monitoring the VA.
> > + */
> > +static bool mn_itree_is_invalidating(struct mmu_notifier_mm *mmn_mm)
> > +{
> > +	lockdep_assert_held(&mmn_mm->lock);
> > +	return mmn_mm->invalidate_seq & 1;
> > +}
> > +
> > +static struct mmu_range_notifier *
> > +mn_itree_inv_start_range(struct mmu_notifier_mm *mmn_mm,
> > +			 const struct mmu_notifier_range *range,
> > +			 unsigned long *seq)
> > +{
> > +	struct interval_tree_node *node;
> > +	struct mmu_range_notifier *res =3D NULL;
> > +
> > +	spin_lock(&mmn_mm->lock);
> > +	mmn_mm->active_invalidate_ranges++;
> > +	node =3D interval_tree_iter_first(&mmn_mm->itree, range->start,
> > +					range->end - 1);
> > +	if (node) {
> > +		mmn_mm->invalidate_seq |=3D 1;
> =

> =

> OK, this either needs more documentation and assertions, or a different
> approach. Because I see addition, subtraction, AND, OR and booleans
> all being applied to this field, and it's darn near hopeless to figure
> out whether or not it really is even or odd at the right times.
> =

> Different approach: why not just add a mmn_mm->is_invalidating =

> member variable? It's not like you're short of space in that struct.

The invalidate_seq scheme looks fine to me, maybe it can use more comments.


> =

> =

> > +		res =3D container_of(node, struct mmu_range_notifier,
> > +				   interval_tree);
> > +	}
> > +
> > +	*seq =3D mmn_mm->invalidate_seq;
> > +	spin_unlock(&mmn_mm->lock);
> > +	return res;
> > +}
> > +
> > +static struct mmu_range_notifier *
> > +mn_itree_inv_next(struct mmu_range_notifier *mrn,
> > +		  const struct mmu_notifier_range *range)
> > +{
> > +	struct interval_tree_node *node;
> > +
> > +	node =3D interval_tree_iter_next(&mrn->interval_tree, range->start,
> > +				       range->end - 1);
> > +	if (!node)
> > +		return NULL;
> > +	return container_of(node, struct mmu_range_notifier, interval_tree);
> > +}
> > +
> > +static void mn_itree_inv_end(struct mmu_notifier_mm *mmn_mm)
> > +{
> > +	struct mmu_range_notifier *mrn;
> > +	struct hlist_node *next;
> > +	bool need_wake =3D false;
> > +
> > +	spin_lock(&mmn_mm->lock);
> > +	if (--mmn_mm->active_invalidate_ranges ||
> > +	    !mn_itree_is_invalidating(mmn_mm)) {
> > +		spin_unlock(&mmn_mm->lock);
> > +		return;
> > +	}
> > +
> > +	mmn_mm->invalidate_seq++;
> =

> Is this the right place for an assertion that this is now an even value?

Yes at that point it should be even ie mmn_mm->active_invalidate_ranges =3D=
=3D 0
and we are holding the lock thus nothing can set the lower bit of invalidat=
e_seq
and ++ should lead to even number.

> =

> > +	need_wake =3D true;
> > +
> > +	/*
> > +	 * The inv_end incorporates a deferred mechanism like
> > +	 * rtnl_lock(). Adds and removes are queued until the final inv_end
> =

> Let me point out that rtnl_lock() itself is a one-liner that calls mutex_=
lock().
> But I suppose if one studies that file closely there is more. :)

I think i commented in v1 about rtnl_lock() being something network people =
only
might be familiar, i think i saw it documented somewhere, maybe a lwn artic=
le.
But if you are familiar with network it is a think well understood ... for =
any
reasonable network scholar ;)

> ...
> =

> > +unsigned long mmu_range_read_begin(struct mmu_range_notifier *mrn)
> > +{
> > +	struct mmu_notifier_mm *mmn_mm =3D mrn->mm->mmu_notifier_mm;
> > +	unsigned long seq;
> > +	bool is_invalidating;
> > +
> > +	/*
> > +	 * If the mrn has a different seq value under the user_lock than we
> > +	 * started with then it has collided.
> > +	 *
> > +	 * If the mrn currently has the same seq value as the mmn_mm seq, then
> > +	 * it is currently between invalidate_start/end and is colliding.
> > +	 *
> > +	 * The locking looks broadly like this:
> > +	 *   mn_tree_invalidate_start():          mmu_range_read_begin():
> > +	 *                                         spin_lock
> > +	 *                                          seq =3D READ_ONCE(mrn->in=
validate_seq);
> > +	 *                                          seq =3D=3D mmn_mm->invali=
date_seq
> > +	 *                                         spin_unlock
> > +	 *    spin_lock
> > +	 *     seq =3D ++mmn_mm->invalidate_seq
> > +	 *    spin_unlock
> > +	 *     op->invalidate_range():
> > +	 *       user_lock
> > +	 *        mmu_range_set_seq()
> > +	 *         mrn->invalidate_seq =3D seq
> > +	 *       user_unlock
> > +	 *
> > +	 *                          [Required: mmu_range_read_retry() =3D=3D =
true]
> > +	 *
> > +	 *   mn_itree_inv_end():
> > +	 *    spin_lock
> > +	 *     seq =3D ++mmn_mm->invalidate_seq
> > +	 *    spin_unlock
> > +	 *
> > +	 *                                        user_lock
> > +	 *                                         mmu_range_read_retry():
> > +	 *                                          mrn->invalidate_seq !=3D =
seq
> > +	 *                                        user_unlock
> > +	 *
> > +	 * Barriers are not needed here as any races here are closed by an
> > +	 * eventual mmu_range_read_retry(), which provides a barrier via the
> > +	 * user_lock.
> > +	 */
> > +	spin_lock(&mmn_mm->lock);
> > +	/* Pairs with the WRITE_ONCE in mmu_range_set_seq() */
> > +	seq =3D READ_ONCE(mrn->invalidate_seq);
> > +	is_invalidating =3D seq =3D=3D mmn_mm->invalidate_seq;
> > +	spin_unlock(&mmn_mm->lock);
> > +
> > +	/*
> > +	 * mrn->invalidate_seq is always set to an odd value. This ensures
> =

> This claim just looks wrong the first N times one reads the code, given t=
hat
> there is mmu_range_set_seq() to set it to an arbitrary value!  Maybe you =
mean
> =

> "is always set to an odd value when invalidating"??

No it is always odd, you must call mmu_range_set_seq() only from the
op->invalidate_range() callback at which point the seq is odd. As well
when mrn is added and its seq first set it is set to an odd value
always. Maybe the comment, should read:

 * mrn->invalidate_seq is always, yes always, set to an odd value. This ens=
ures

To stress that it is not an error.

> =

> > +	 * that if seq does wrap we will always clear the below sleep in some
> > +	 * reasonable time as mmn_mm->invalidate_seq is even in the idle
> > +	 * state.
> > +	 */
> =

> Let's move that comment higher up. The code that follows it has nothing to
> do with it, so it's confusing here.

No the comment is in the right place, the fact that it is odd and that
idle state is even explains why the wait() will never last forever.
Already had a discussion on this in v1.

[...]

> > +	/*
> > +	 * If some invalidate_range_start/end region is going on in parallel
> > +	 * we don't know what VA ranges are affected, so we must assume this
> > +	 * new range is included.
> > +	 *
> > +	 * If the itree is invalidating then we are not allowed to change
> > +	 * it. Retrying until invalidation is done is tricky due to the
> > +	 * possibility for live lock, instead defer the add to the unlock so
> > +	 * this algorithm is deterministic.
> > +	 *
> > +	 * In all cases the value for the mrn->mr_invalidate_seq should be
> > +	 * odd, see mmu_range_read_begin()
> > +	 */
> > +	spin_lock(&mmn_mm->lock);
> > +	if (mmn_mm->active_invalidate_ranges) {
> > +		if (mn_itree_is_invalidating(mmn_mm))
> > +			hlist_add_head(&mrn->deferred_item,
> > +				       &mmn_mm->deferred_list);
> > +		else {
> > +			mmn_mm->invalidate_seq |=3D 1;
> > +			interval_tree_insert(&mrn->interval_tree,
> > +					     &mmn_mm->itree);
> > +		}
> > +		mrn->invalidate_seq =3D mmn_mm->invalidate_seq;
> > +	} else {
> > +		WARN_ON(mn_itree_is_invalidating(mmn_mm));
> > +		mrn->invalidate_seq =3D mmn_mm->invalidate_seq - 1;
> =

> Ohhh, checkmate. I lose. Why is *subtracting* the right thing to do
> for seq numbers here?  I'm acutely unhappy trying to figure this out.
> I suspect it's another unfortunate side effect of trying to use the
> lower bit of the seq number (even/odd) for something else.

If there is no mmn_mm->active_invalidate_ranges then it means that
mmn_mm->invalidate_seq is even and thus mmn_mm->invalidate_seq - 1
is an odd number which means that mrn->invalidate_seq is initialized
to odd value and if you follow the rule for calling mmu_range_set_seq()
then it will _always_ be an odd number and this close the loop with
the above comments :)

> =

> > +		interval_tree_insert(&mrn->interval_tree, &mmn_mm->itree);
> > +	}
> > +	spin_unlock(&mmn_mm->lock);
> > +	return 0;
> > +}
> > +
> > +/**
> > + * mmu_range_notifier_insert - Insert a range notifier
> > + * @mrn: Range notifier to register
> > + * @start: Starting virtual address to monitor
> > + * @length: Length of the range to monitor
> > + * @mm : mm_struct to attach to
> > + *
> > + * This function subscribes the range notifier for notifications from =
the mm.
> > + * Upon return the ops related to mmu_range_notifier will be called wh=
enever
> > + * an event that intersects with the given range occurs.
> > + *
> > + * Upon return the range_notifier may not be present in the interval t=
ree yet.
> > + * The caller must use the normal range notifier locking flow via
> > + * mmu_range_read_begin() to establish SPTEs for this range.
> > + */
> > +int mmu_range_notifier_insert(struct mmu_range_notifier *mrn,
> > +			      unsigned long start, unsigned long length,
> > +			      struct mm_struct *mm)
> > +{
> > +	struct mmu_notifier_mm *mmn_mm;
> > +	int ret;
> =

> Hmmm, I think a later patch improperly changes the above to "int ret =3D =
0;".
> I'll check on that. It's correct here, though.
> =

> > +
> > +	might_lock(&mm->mmap_sem);
> > +
> > +	mmn_mm =3D smp_load_acquire(&mm->mmu_notifier_mm);
> =

> What does the above pair with? Should have a comment that specifies that.

It was discussed in v1 but maybe a comment of what was said back then would
be helpful. Something like:

/*
 * We need to insure that all writes to mm->mmu_notifier_mm are visible bef=
ore
 * any checks we do on mmn_mm below as otherwise CPU might re-order write d=
one
 * by another CPU core to mm->mmu_notifier_mm structure fields after the re=
ad
 * belows.
 */

Cheers,
J=E9r=F4me

_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
