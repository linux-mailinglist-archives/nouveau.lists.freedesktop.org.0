Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F1754CCD115
	for <lists+nouveau@lfdr.de>; Thu, 18 Dec 2025 19:00:23 +0100 (CET)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id C722310EA66;
	Thu, 18 Dec 2025 18:00:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="B/QTYXIY";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 76B6844B96;
	Thu, 18 Dec 2025 17:52:51 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1766080371;
 b=q3wBFBcKHlKmeqmVBNlu1MsqrYKBbrY9GfgG7vZknnNhXhmlwdL5Svtat5hVygmAgfqC9
 7YNGEyQCMeTgrNXwPW1X5cE9ClLHhvNLoQ2qKEdcY1/R/+CXQcRY8K9mjXmBbyeNQN9iCGj
 n77qUYiJJeWU9C0CNmi9fnL4CR/kMCq4z5QolkeUK6/Bs9VZjVjXirm/l9iBWWXyATpQg0T
 U846TE6w7gqGMQO8SNRXXwd8jtZLOzwNXXNO15d68pCqDNEMTC4oSPpYWijO368UAigbSHZ
 97pf0AggSznadzxLafUWyODiBg1nwKzXCbhRESWjfJKbIheU+X5C6lqu2OKw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1766080371; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=RkOFOrNDQ6sl7Mqdc1VhggmfNaVju147chi0D9kqqyk=;
 b=Z93Wa/LFCFMHV6/wz7gKu2SXX8ZtgQYaszosnuhdt+ECsu6wCPN7r6/cBBT/xR0IRDvHB
 CiApvUhed9ouzQPNrEBPc5I7ZPpwGhirNFAgfhs4X/YZlOQVf+tUsCRZVFgAOgtNf0aaV7D
 RyDd6Ttvnrez6iLg66fCHLYfhdW45YVb7OFxLE+rKEPlS09xU53SDrIQZ+gpgnSbGMOeYcT
 7ozcz5GjgE2XgLJ+zIUhbliQ2Cw0FyiveMOXx6YwNcbk6FAfMJGmf1TnTSIfNVfpSRJcet4
 nYqWfYbYdtf5hlOig+K3MG1+8RO/ARym6ih09WTx5F9lvIBEMe8EgYTRMZ8A==
ARC-Authentication-Results: i=2; mail.freedesktop.org;
 dkim=pass header.d=google.com;
  arc=pass;
  dmarc=pass (Used From Domain Record) header.from=google.com
 policy.dmarc=reject
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=google.com;
 arc=pass;
 dmarc=pass (Used From Domain Record) header.from=google.com policy.dmarc=reject
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 471CE44B91
	for <nouveau@lists.freedesktop.org>; Thu, 18 Dec 2025 17:52:49 +0000 (UTC)
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com
 [209.85.208.51])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 4BFB510EA52
	for <nouveau@lists.freedesktop.org>; Thu, 18 Dec 2025 18:00:20 +0000 (UTC)
Received: by mail-ed1-f51.google.com with SMTP id
 4fb4d7f45d1cf-64b66d427e9so328a12.1
        for <nouveau@lists.freedesktop.org>;
 Thu, 18 Dec 2025 10:00:20 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1766080819; cv=none;
        d=google.com; s=arc-20240605;
        b=kGU2YQGQN3KoKhAd4M8ltPTZg/mKT7KnK+oAWG9p2Cg7JgdjVI4LYNaEcusii8UvGH
         szdFzwomldXnBf6JgABJMiCAxfLK5rpjhahsUay4wV2sYG4LWjY94sqyWffbr02vlnmh
         2LA6VzHJ7zDT24YWfmZU7q5vfPfnu2u5ghlLZeZORYNp4/98PlZUf6UsRe0tK68jxpTa
         rIVZ19MMp25X9RiF7uWxQA2KW98TeUfSHepC7CDpUCXb9QoX13Au1O14R91Gfh01/h2P
         rIAkXurNpYJYf3gyxgu9F8VHm4dCeuc20z3PmzHMEOySqKaLevGZDQVrtobll4WK38B6
         VkZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=RkOFOrNDQ6sl7Mqdc1VhggmfNaVju147chi0D9kqqyk=;
        fh=z6E4OLfh5kjkYFiXmrsTwZUJdtDSkbGfJmdfFMAFUNY=;
        b=PxbBn7nlo5Ej+Zlk8eIxDqs+zzLkRb1AVNTBk9QLJTbvLC7FsQj30DIzqAs3MiZ5iA
         bgZqdW8st8ihtSe6cic4TiBDc6r9wVuh3vpGXMiiYrbiotQADCCqNKtE+vuzHyTp2ybY
         +ktz6S3nd7O/ab7kniQZqO2nPO4wMAbyI7d/PWmpKGyQEtPTlcwfs0C/IoHLQgqL7J2l
         NdMEfuKOdRKvfKKHPyG9r+D9is6IlXsk1HTE7kSi3hm6ZxB41UUCHok5lDavykqQOkR1
         QEgFaCuOUKr50lgMLNRivwGC7RpPD75/i4GJiH7tWK2niD6hiWQ9GG8r7Ty6tsceC9VX
         YoNw==;
        darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1766080819; x=1766685619;
 darn=lists.freedesktop.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RkOFOrNDQ6sl7Mqdc1VhggmfNaVju147chi0D9kqqyk=;
        b=B/QTYXIYOofesDCMK5Njz9pSZanSitFRuzp0TbMZ/uK3TWJCwJJsKVbjeQBb0MB6Oy
         BRnzawO6uenjB4327duGXx2qh0B7QBwO9OcJ92hAIeoxArErNb03Z0tlQrDJrMY4Mzil
         S2eQSTziEOmwtPpfxnaIsmj/Y8TRu2Dt+PcpQA7sYfonPq1KWGJHukw4fM9a7b9dPbMC
         32IZhNXH9A8I+/S4EL1L9J2CsfWBHXKLteVq4acs51XvWzeRp7/4Ky1NRaf4NoWM8cmD
         0jwLhGFuRpdJBVk4cynPrlL0+KilNW2HsZLeeiHUNfqujLPfPWPcGXu9MYhOeIN6sTfK
         awWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766080819; x=1766685619;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=RkOFOrNDQ6sl7Mqdc1VhggmfNaVju147chi0D9kqqyk=;
        b=nacp/4+rld8Mcr/Kqzk/3SqCukhr/ci9gYydLOT5kJOoGELW42LgO9J81VmReE2tb/
         hs/FiE+gNCS0ON6D78tkL1Shvu99iq5RLGtW5JCwkWbhWfzovlfYGJTiOKqTodqHYn+3
         GtL3v6qFNhCTzXp6HaqPbsieYhRFbSRdou87M18tIcKN0a7WGkHQIkeVXg2DFE68D6BK
         LHbeMyPsj8ErbQrIFNeCCictf0R6dyiaKiiwb0zRsQ+1LKmLmO4rBHKECQgXamM3/Vja
         XHtdQ3qwzD3r0n+VwpdHA9wxa9ilnhr1ThvklzMuuhGHz+dEMYgiJKQWS3p3DFRSShas
         di5Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCU4VmeoPFNRXgFO7m+poT5ZsFh8XAVlY96XpqNh2SuC9N9ee6GXg1j3k2AtDqGqvmgNoGY9W8az@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxFcfBZEbJKJOCqYwyGTgHlaK2UThb9ivj0k/uhREtPj1pe8tTB
	3JbOoJVtxECCyzz/tad1uLe1FhXFUcxMyl25Uvv1/4RrO5yCggS/Crmw2UXel2XhoSpzq9/ugHw
	q+ORkoN0Y7qfELjOWVcWI8VwWBGmIv/rp4x9PEudz
X-Gm-Gg: AY/fxX4vB51/D7H1SfxIHrdizWAPhfarlg90Cy0q3RsMh2TvrwuhZfH1n/NQVb+XL67
	88M5g2xla1Zbk+IesgVbqsunP6c7jjc17kJPOpHbk2lFgKaMmqNm5TgwL9HNNmg3Fk55tsV04T6
	kVJ37jiPJkL6ThL1oGt4zm0/XX3SlAaRw8+d65o5gALS0+W0KES/MzgqrSxkLX8wZA+4SQZOrrL
	Zq6yuQWy/joCz8/NILmFRL0mpC7k5F0/lgHRRY2iQr1YpmXBR7A1SQw3a0I25NqLCgKvlThJsAN
	PuLCgqSph0LYBGnVvN89EuuK1g==
X-Google-Smtp-Source: 
 AGHT+IHLrlyaCiPiXB+zoeHL1JoVQY7quXpfW6ET/ferqEfqVPExNhRL6m+Qn/OACk5JrhhmtH9Dy6ybDE2MOA7b1A8=
X-Received: by 2002:aa7:d991:0:b0:64b:4a02:f726 with SMTP id
 4fb4d7f45d1cf-64b6049edeemr37436a12.10.1766080818459; Thu, 18 Dec 2025
 10:00:18 -0800 (PST)
MIME-Version: 1.0
References: <20251218013910.459045-1-ttabi@nvidia.com>
 <20251218013910.459045-3-ttabi@nvidia.com>
In-Reply-To: <20251218013910.459045-3-ttabi@nvidia.com>
From: Matthew Maurer <mmaurer@google.com>
Date: Thu, 18 Dec 2025 10:00:06 -0800
X-Gm-Features: AQt7F2pc-7ddV47KGcSn-HvKuZIO6w4T0qZbwJ2Xn-u1d3wDsWJuBl-RQHd8pYY
Message-ID: 
 <CAGSQo03HVquX1Bc7tsFjWgA-=BX=1eefXt=r-Rdtxca81QPXgA@mail.gmail.com>
Subject: Re: [PATCH v3 2/9] rust: debugfs: add lookup contructor
To: Timur Tabi <ttabi@nvidia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: IVL3LQPLGCAJCKNKHGZEHYFSMJFJ2OIF
X-Message-ID-Hash: IVL3LQPLGCAJCKNKHGZEHYFSMJFJ2OIF
X-MailFrom: mmaurer@google.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
CC: Gary Guo <gary@garyguo.net>, Danilo Krummrich <dakr@kernel.org>,
 rust-for-linux@vger.kernel.org, Joel Fernandes <joelagnelf@nvidia.com>,
 Alexandre Courbot <acourbot@nvidia.com>, nouveau@lists.freedesktop.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/IVL3LQPLGCAJCKNKHGZEHYFSMJFJ2OIF/>
Archived-At: 
 <https://lore.freedesktop.org/CAGSQo03HVquX1Bc7tsFjWgA-=BX=1eefXt=r-Rdtxca81QPXgA@mail.gmail.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Wed, Dec 17, 2025 at 5:40=E2=80=AFPM Timur Tabi <ttabi@nvidia.com> wrote=
:
>
> Add a new constructor for Dir that uses the debugfs_lookup() API to
> obtain a reference to an existing debugfs directory entry.
>
> The key difference from Dir::new() and Dir::subdir() is the cleanup
> semantics: when a Dir obtained via lookup() is dropped, it calls
> dput() to release the reference rather than debugfs_remove() which
> would delete the directory.
>
> To implement this cleanup distinction, the Entry class now includes
> an is_lookup boolean that specifies how the entry was created and
> therefore how it should be dropped.
>
> Signed-off-by: Timur Tabi <ttabi@nvidia.com>
> ---
>  rust/kernel/debugfs.rs       | 43 +++++++++++++++++++++++++++++++
>  rust/kernel/debugfs/entry.rs | 49 +++++++++++++++++++++++++++++++++---
>  2 files changed, 89 insertions(+), 3 deletions(-)
>
> diff --git a/rust/kernel/debugfs.rs b/rust/kernel/debugfs.rs
> index facad81e8290..eee799f64f79 100644
> --- a/rust/kernel/debugfs.rs
> +++ b/rust/kernel/debugfs.rs
> @@ -110,6 +110,49 @@ pub fn new(name: &CStr) -> Self {
>          Dir::create(name, None)
>      }
>
> +    /// Looks up an existing directory in DebugFS.
> +    ///
> +    /// If `parent` is [`None`], the lookup is performed from the root o=
f the debugfs filesystem.
> +    ///
> +    /// Returns [`Some(Dir)`] representing the looked-up directory if fo=
und, or [`None`] if the
> +    /// directory does not exist or if debugfs is not enabled. When drop=
ped, the [`Dir`] will
> +    /// release its reference to the dentry without removing the directo=
ry from the filesystem.
> +    ///
> +    /// # Examples
> +    ///
> +    /// ```
> +    /// # use kernel::c_str;
> +    /// # use kernel::debugfs::Dir;
> +    /// // Look up a top-level directory
> +    /// let nova_core =3D Dir::lookup(c_str!("nova_core"), None);
> +    ///
> +    /// // Look up a subdirectory within a parent
> +    /// let parent =3D Dir::new(c_str!("parent"));
> +    /// let child =3D parent.subdir(c_str!("child"));
> +    /// let looked_up =3D Dir::lookup(c_str!("child"), Some(&parent));
> +    /// // `looked_up` now refers to the same directory as `child`.
> +    /// // Dropping `looked_up` will not remove the directory.
> +    /// ```

This also breaks the assumption people were able to have with `Dir`
previously that if they have a `Dir` and debugfs is enabled, it's
usable for creating subdirs/files.

This might be considered an issue, but at minimum it needs to be documented=
.

> +    pub fn lookup(name: &CStr, parent: Option<&Dir>) -> Option<Self> {

We were explicitly asked by Greg *not* to expose error conditions in
directory constructors. I would expect that to extend to `lookup` as
well, so this would return a `Self`, not allowing the caller to find
out if the file was actually there. This might be a bit of a grey area
as the comment he cited on `debugfs_create_file` and friends has
explicit verbiage about it being bad form to check errors here and
`debugfs_lookup` mentions explicitly a null return for the file not
being there.

Another point in favor of just returning `Self` rather than
`Option<Self>` is that in your proposed real-world usage of this, you
create a dummy directory in the `None` case.

> +        #[cfg(CONFIG_DEBUG_FS)]
> +        {

We shouldn't need to track a parent entry here, and so shouldn't need
to do the whole cloning dance.

> +            let parent_entry =3D match parent {
> +                // If the parent couldn't be allocated, just early-retur=
n
> +                Some(Dir(None)) =3D> return None,
> +                Some(Dir(Some(entry))) =3D> Some(entry.clone()),
> +                None =3D> None,
> +            };
> +            let entry =3D Entry::lookup(name, parent_entry)?;

There's no guarantee that this lookup has returned a directory - a
lookup can return files too afaict

> +            Some(Self(
> +                // If Arc creation fails, the `Entry` will be dropped, s=
o the reference will be
> +                // released.
> +                Arc::new(entry, GFP_KERNEL).ok(),
> +            ))
> +        }
> +        #[cfg(not(CONFIG_DEBUG_FS))]
> +        None
> +    }
> +
>      /// Creates a subdirectory within this directory.
>      ///
>      /// # Examples
> diff --git a/rust/kernel/debugfs/entry.rs b/rust/kernel/debugfs/entry.rs
> index 706cb7f73d6c..455d7bbb8036 100644
> --- a/rust/kernel/debugfs/entry.rs
> +++ b/rust/kernel/debugfs/entry.rs
> @@ -18,6 +18,9 @@ pub(crate) struct Entry<'a> {
>      _parent: Option<Arc<Entry<'static>>>,
>      // If we were created with a non-owning parent, this prevents us fro=
m outliving it
>      _phantom: PhantomData<&'a ()>,
> +    // If true, this entry was obtained via debugfs_lookup and should be=
 released
> +    // with dput() instead of debugfs_remove().
> +    is_lookup: bool,

I agree with Danilo - I think this would be cleaner as a different
type (or at least an enum variant) rather than adding another field
(if we need it). Notably:

1. `_parent` is not required for a lookup entry - the lookup doesn't
need to keep it alive, because it's not using the "If I have the
directory handle, I can create real files in it" semantics we had
before.
2. The `_phantom` is irrelevant for a lookup entry because they can't be sc=
oped
3. The drop behavior is different (which you're gating with `is_lookup`).

Basically the only part that is the same is the presence of a dentry
pointer under the hood.


>  }
>
>  // SAFETY: [`Entry`] is just a `dentry` under the hood, which the API pr=
omises can be transferred
> @@ -43,9 +46,38 @@ pub(crate) fn dynamic_dir(name: &CStr, parent: Option<=
Arc<Self>>) -> Self {
>              entry,
>              _parent: parent,
>              _phantom: PhantomData,
> +            is_lookup: false,
>          }
>      }
>
> +    /// Looks up an existing entry in debugfs.
> +    ///
> +    /// Returns [`Some(Entry)`] representing the looked-up dentry if the=
 entry exists, or [`None`]
> +    /// if the entry was not found. When dropped, the entry will release=
 its reference via `dput()`
> +    /// instead of removing the directory.
> +    pub(crate) fn lookup(name: &CStr, parent: Option<Arc<Self>>) -> Opti=
on<Self> {
> +        let parent_ptr =3D match &parent {
> +            Some(entry) =3D> entry.as_ptr(),
> +            None =3D> core::ptr::null_mut(),
> +        };
> +        // SAFETY: The invariants of this function's arguments ensure th=
e safety of this call.
> +        // * `name` is a valid C string by the invariants of `&CStr`.
> +        // * `parent_ptr` is either `NULL` (if `parent` is `None`), or a=
 pointer to a valid
> +        //   `dentry` by our invariant. `debugfs_lookup` handles `NULL` =
pointers correctly.
> +        let entry =3D unsafe { bindings::debugfs_lookup(name.as_char_ptr=
(), parent_ptr) };
> +
> +        if entry.is_null() {
> +            return None;
> +        }
> +
> +        Some(Entry {
> +            entry,
> +            _parent: parent,
> +            _phantom: PhantomData,
> +            is_lookup: true,
> +        })
> +    }
> +
>      /// # Safety
>      ///
>      /// * `data` must outlive the returned `Entry`.
> @@ -76,6 +108,7 @@ pub(crate) unsafe fn dynamic_file<T>(
>              entry,
>              _parent: Some(parent),
>              _phantom: PhantomData,
> +            is_lookup: false,
>          }
>      }
>  }
> @@ -97,6 +130,7 @@ pub(crate) fn dir(name: &CStr, parent: Option<&'a Entr=
y<'_>>) -> Self {
>              entry,
>              _parent: None,
>              _phantom: PhantomData,
> +            is_lookup: false,
>          }
>      }
>
> @@ -129,6 +163,7 @@ pub(crate) fn file<T>(
>              entry,
>              _parent: None,
>              _phantom: PhantomData,
> +            is_lookup: false,
>          }
>      }
>  }
> @@ -140,6 +175,7 @@ pub(crate) fn empty() -> Self {
>              entry: core::ptr::null_mut(),
>              _parent: None,
>              _phantom: PhantomData,
> +            is_lookup: false,
>          }
>      }
>
> @@ -157,8 +193,15 @@ pub(crate) fn as_ptr(&self) -> *mut bindings::dentry=
 {
>
>  impl Drop for Entry<'_> {
>      fn drop(&mut self) {
> -        // SAFETY: `debugfs_remove` can take `NULL`, error values, and l=
egal DebugFS dentries.
> -        // `as_ptr` guarantees that the pointer is of this form.
> -        unsafe { bindings::debugfs_remove(self.as_ptr()) }
> +        if self.is_lookup {
> +            // SAFETY: `dput` can take `NULL` and legal dentries.
> +            // `as_ptr` guarantees that the pointer is of this form.
> +            // This entry was obtained via `debugfs_lookup`, so we relea=
se the reference.
> +            unsafe { bindings::dput(self.as_ptr()) }
> +        } else {
> +            // SAFETY: `debugfs_remove` can take `NULL`, error values, a=
nd legal DebugFS dentries.
> +            // `as_ptr` guarantees that the pointer is of this form.
> +            unsafe { bindings::debugfs_remove(self.as_ptr()) }
> +        }
>      }
>  }
> --
> 2.52.0
>
>
