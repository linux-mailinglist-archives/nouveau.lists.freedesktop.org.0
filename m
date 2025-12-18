Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E831CCD09D
	for <lists+nouveau@lfdr.de>; Thu, 18 Dec 2025 18:56:09 +0100 (CET)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 6C96E10E933;
	Thu, 18 Dec 2025 17:56:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="UAOlcsTU";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 205B944B90;
	Thu, 18 Dec 2025 17:48:37 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1766080117;
 b=Pu1Kmzzf8ZBxqlhjGdOyJtA1iowDl8s/9Pnb6BzH20+Ba+v5bMFr4KmGQf6cXz05eKodx
 FjTfkVpxC4QnEOz/+LYGfOwwXdC9wWl1sHNmIkYv6QsE9zFt0rM/pK0rAg2US39hLNnOYlc
 jlhIAxgYSYYOVX6KQ+pfSlR9rZttCO3W/KjRNDnIgYvZg50mxW6vNopGBlt913WSFVXundW
 yxJHIhERsLzcVTd8Zasq3OKQjuiuik05Ft3vXBNdG8xRdqWQ8kGBuh63hVqUx7vcTyit20N
 kkuEcIWOUVftnAFN6FkXNAGA/6FHJdDlJ9xGL3v8ru44ek/O4Sh3MfSmECBw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1766080117; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=6VUzMiqBHmKzNWKto2HvOLw6cqfGk8Cwe3jOAE02okU=;
 b=W3xDWgDKml2BpPelkFISR4m8bwomgRKhw2jufRYDmVVtI8fFoO6tiSRN5IrgymrP69rV/
 sVGgzYHG4ApH/Qgnnw+yc7QV9IEgJX6oDKEuyKK4IKxGy4S/4xdNNB20qSJQLLDSiR9Jnel
 LbV6MU+4NIpuwqm1+CosBrufWRLO2IWQoyod7Cvu9lEKxWZv+bXKPwWmH0LdaHRgvwfpSfu
 I/QzgBOogK9CjdcJDELeGAFnHkh1fAHgo5F5Cl/Ak0zNOuRW1Q6rCuQsHZlsX5eJ/Fisrdm
 uJ9nuIDGfKSfy53FEY1Z6g24GQRl4QSJScKQScwBGqqQB4AKIwhxliset6+g==
ARC-Authentication-Results: i=2; mail.freedesktop.org;
 dkim=pass header.d=google.com;
  arc=pass;
  dmarc=pass (Used From Domain Record) header.from=google.com
 policy.dmarc=reject
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=google.com;
 arc=pass;
 dmarc=pass (Used From Domain Record) header.from=google.com policy.dmarc=reject
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 2D8C144B8C
	for <nouveau@lists.freedesktop.org>; Thu, 18 Dec 2025 17:48:33 +0000 (UTC)
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com
 [209.85.208.52])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 2911D10E1BE
	for <nouveau@lists.freedesktop.org>; Thu, 18 Dec 2025 17:56:04 +0000 (UTC)
Received: by mail-ed1-f52.google.com with SMTP id
 4fb4d7f45d1cf-64b66d427e9so233a12.1
        for <nouveau@lists.freedesktop.org>;
 Thu, 18 Dec 2025 09:56:04 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1766080563; cv=none;
        d=google.com; s=arc-20240605;
        b=eyUSz5gCIA5Pxx4qMfNu4bw81+M129jpa+WOUEQcnCBy8KD5+8PTJ6IKV0qEg49BO6
         ewdOpwLyYHBxOR3cVlKELJdOxlEcZsbrMuljPgXogaYSb0uSBfkaCb5y6qPRxlokn3Mi
         sJvaLHQyY97mkMc/wZuCY2FwJbpIcYDiJnTSK9kyLOTLlL3pXyQuU8LGOXulqADKcs5x
         rmzmeLonkdg9aB2mazS1M/vx3rHQE1zNBsZ2Gs5DH5NTAsgdgazHrf8EMp1Yp0rb2mr1
         ycYkncrXrtGKG4SZ5Qdo6R1DRtxn+1sO+BxKzcXONTgAKbQJ2KZJi3fm9/EaqdrQOBOw
         No7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=6VUzMiqBHmKzNWKto2HvOLw6cqfGk8Cwe3jOAE02okU=;
        fh=dCtploEeg1i2DJArwd2kFsHumVn9cRBN0YKmIuWpsek=;
        b=F/lVOK2RBHXcHbCB3hXrhXn7NmHjkwLMOq5ir/AzvaeuI6yI+H1NHFENY8XSjPtEdo
         iUrN1itt9X7PseiOpO5tFrLNWBKZQiAcJExcBkTcAw/zhNEeTFgdLFP/+x9uzUbisToP
         wlhs7xfWB/Dnwect78iJKnvNh0vu1DGshJ7tqrMpr6kRVhnz+MAl8k8mGdqyF500YDHk
         ICVoIlQYwLKS9WnhjQo6jHOi1h9ECbyB3gwlNlFNzreX/Q9cZXVKvhRnnc0UKJdiXzgn
         mlDRE/6GPGmHm/fT2oh88AhBaXmB5VMEDnElKoXp3nmxUhS/8ebslkDsixYrmuRAB11H
         djqA==;
        darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1766080563; x=1766685363;
 darn=lists.freedesktop.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6VUzMiqBHmKzNWKto2HvOLw6cqfGk8Cwe3jOAE02okU=;
        b=UAOlcsTUTK5c8sOnGVWt9eMcA+dDISzGYjMvTGZbyYUsESZoO7pnQP/UhdDpAAuVWp
         6M4g9LR7ODxE5qhI6h89mPmLk4G0eMUE+W9PfLb/zMe8OT/pEHTxYDB5VE2uGr6VP0o5
         a9358yYDZMdL+Nwj/WXr6WtEF2zNYOfSf6oSqnTW/IyIM63UH2sice2gx9xzEzkJ18Gd
         YvW+W7qxwshNyp9Gt72+gn/TrrdkYbS3r+Qh3qjmnCXBmzXGTw52kF4xUG5oX+hQsg4S
         VJPU/i2Z8LE3kI6GsnQIrDN2ea0SS2B0NjUhYFdGnTbEom3s5c8xCK6VH3GTq6lD4mBu
         wOFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766080563; x=1766685363;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=6VUzMiqBHmKzNWKto2HvOLw6cqfGk8Cwe3jOAE02okU=;
        b=pKTLXzX1pw+8VGG6Hp6f7EAm2fOCzA8k/pb14LOBYFSU1j9wIps2Bn4waZ7JlOlAI7
         djZ2HAOoHAbqgPXNA9tGLAwyyCQuqxQFTUkFQeETKeLQdE1f+66s1TzSnL1CQtBg8NQ7
         NUi+l0z1WNryo1Ys8ktbv8oGBtdZk99kicLldgQ8n0m+0PLcqilxjliXWCUqf/Aly3sY
         3y0F+3tMDcl07gcEu210BrkGlT16EuBMsCZbzQPTAyRyk9cT4dSnmyFLMrpCRR2LU4XY
         kipqmq/vho+kfHMUHkgMzxGf3fmPFsSiG4kc2ngETA5Cs05ICzCedut4vFwtSFm0feWh
         UrNg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVqnF7y677pxx+l8BRfzhJYFi8+jhmqYWWm2cQxLFBGYgtAH70sV50tTyN65N4eaYi8E9Ci9mPQ@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxVr7eg1nxvzGFPkIY+e8qfoaT+8PQ0QCyftoXfAEmW2BnAmlIj
	QqgRkPJB+5ZHTIbe/8Nq5bnCdH+Q7dRWe2AVQoG7KEcRSIZftSdwZr1dLOtXEiYbYLP3HHfXJWy
	5Bvfa/7EPixjbbDYS5obMtZjZwTM6eY8VqsDmEkbE
X-Gm-Gg: AY/fxX6DuXEzNBe97VwDTmYTTa7l8TxC4y23evmVnHY4y+ds1cWZOMQK9HtTql7Pq4A
	S8DjMhp/r1TI1tKgm612kjIzapsH0YEyTjP/1TQX2sXLrd4brOPdv4HdoY4HDn0rFd8AqqXfJgF
	vjN2QY7zW6JjLRMnc1VV8WGHqrHvqUFrA8pzck4RFyjmLh4VvpaCIJEAq1heHcE+HwN85/WoAR7
	78dhrDI/0Tdupsr7E1De4vQ6H4D2uZwo48nmjFzGgURih1V4XEWvwHOaa0oSeijJhpcTPfDdl6n
	vVFHY+7JTWCufF1om0dtc3ay8w==
X-Google-Smtp-Source: 
 AGHT+IHVyaWWgwsSupXfKFQ7OkZkgOJ7OGNJ/x6BKqBXiiPRaGYHt4hLIIWDzIyyc2mf4RPP5ex3cGFS72pQcYObF5w=
X-Received: by 2002:aa7:c45a:0:b0:64b:5799:4f76 with SMTP id
 4fb4d7f45d1cf-64b6631ff77mr32032a12.9.1766080562447; Thu, 18 Dec 2025
 09:56:02 -0800 (PST)
MIME-Version: 1.0
References: <20251218013910.459045-1-ttabi@nvidia.com>
 <20251218013910.459045-5-ttabi@nvidia.com>
In-Reply-To: <20251218013910.459045-5-ttabi@nvidia.com>
From: Matthew Maurer <mmaurer@google.com>
Date: Thu, 18 Dec 2025 09:55:49 -0800
X-Gm-Features: AQt7F2pzmTLtn4G7rOL2t2j2zRJQFDUmSCopvYPRXu1Ir2GTVxKnePZbh6PoAX8
Message-ID: 
 <CAGSQo01jefDvfkUF9ScPuiX3vETtVxnebUUSSJPAiiSs+xzRgw@mail.gmail.com>
Subject: Re: [PATCH v3 4/9] rust: debugfs: fix Dir::scope() to not borrow self
 for returned lifetime
To: Timur Tabi <ttabi@nvidia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: O6AFAVOQLTV3NADV6FFQTNWBNNYONN7A
X-Message-ID-Hash: O6AFAVOQLTV3NADV6FFQTNWBNNYONN7A
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/O6AFAVOQLTV3NADV6FFQTNWBNNYONN7A/>
Archived-At: 
 <https://lore.freedesktop.org/CAGSQo01jefDvfkUF9ScPuiX3vETtVxnebUUSSJPAiiSs+xzRgw@mail.gmail.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Wed, Dec 17, 2025 at 5:49=E2=80=AFPM Timur Tabi <ttabi@nvidia.com> wrote=
:
>
> Dir::scope() was declared as taking &'a self, which tied the returned
> PinInit's lifetime to the Dir. This prevented using scope() with a
> locally-created Dir:
>
>     let dir =3D Dir::lookup(...).unwrap_or_else(Dir::empty);
>     let scope =3D dir.scope(...);  // Error: returns value referencing lo=
cal

This looks like you're trying to return an `impl PinInit<Scope>` from
your function (which isn't written in the example, but I assume that's
what you eventually do, otherwise this wouldn't be an error).

The generalized solution to this is to use `pin_init_scope`, i.e.

```
pin_init_scope(|| {
  let dir =3D // Generate a `Dir` somehow here
  let scope =3D dir.scope(/* Scope defining function here */)
  // Anything else you wanted to do
  Ok(scope)
})
```

>
> The borrow was unnecessary since scoped_dir() internally clones the
> Arc<Entry>. Fix this by cloning self.0 before the closure, allowing the
> closure to capture the cloned value via move instead of borrowing self.
>
> This also removes the now-unused scoped_dir() helper method, inlining
> its logic directly into scope().
>
> Signed-off-by: Timur Tabi <ttabi@nvidia.com>
> ---
>  rust/kernel/debugfs.rs | 41 +++++++++++++++++------------------------
>  1 file changed, 17 insertions(+), 24 deletions(-)
>
> diff --git a/rust/kernel/debugfs.rs b/rust/kernel/debugfs.rs
> index b0cfe22982d6..35f9cbb261e7 100644
> --- a/rust/kernel/debugfs.rs
> +++ b/rust/kernel/debugfs.rs
> @@ -397,27 +397,6 @@ pub fn write_callback_file<'a, T, E: 'a, W>(
>          self.create_file(name, data, file_ops)
>      }
>
> -    // While this function is safe, it is intentionally not public becau=
se it's a bit of a
> -    // footgun.
> -    //
> -    // Unless you also extract the `entry` later and schedule it for `Dr=
op` at the appropriate
> -    // time, a `ScopedDir` with a `Dir` parent will never be deleted.
> -    fn scoped_dir<'data>(&self, name: &CStr) -> ScopedDir<'data, 'static=
> {
> -        #[cfg(CONFIG_DEBUG_FS)]
> -        {
> -            let parent_entry =3D match &self.0 {
> -                None =3D> return ScopedDir::empty(),
> -                Some(entry) =3D> entry.clone(),
> -            };
> -            ScopedDir {
> -                entry: ManuallyDrop::new(Entry::dynamic_dir(name, Some(p=
arent_entry))),
> -                _phantom: PhantomData,
> -            }
> -        }
> -        #[cfg(not(CONFIG_DEBUG_FS))]
> -        ScopedDir::empty()
> -    }
> -
>      /// Creates a new scope, which is a directory associated with some d=
ata `T`.
>      ///
>      /// The created directory will be a subdirectory of `self`. The `ini=
t` closure is called to
> @@ -427,7 +406,7 @@ fn scoped_dir<'data>(&self, name: &CStr) -> ScopedDir=
<'data, 'static> {
>      /// The entire directory tree created within the scope will be remov=
ed when the returned
>      /// `Scope` handle is dropped.
>      pub fn scope<'a, T: 'a, E: 'a, F>(
> -        &'a self,
> +        &self,
>          data: impl PinInit<T, E> + 'a,
>          name: &'a CStr,
>          init: F,
> @@ -435,8 +414,22 @@ pub fn scope<'a, T: 'a, E: 'a, F>(
>      where
>          F: for<'data, 'dir> FnOnce(&'data T, &'dir ScopedDir<'data, 'dir=
>) + 'a,
>      {
> -        Scope::new(data, |data| {
> -            let scoped =3D self.scoped_dir(name);
> +        // Clone the parent entry so the closure doesn't need to borrow =
`self`.
> +        #[cfg(CONFIG_DEBUG_FS)]
> +        let parent_entry =3D self.0.clone();

This isn't necessarily a show-stopper, but this lets us create a weird
intermediate state where from the user's PoV, there are no references
to a directory (they don't have the `Dir` anymore, and a `Scope`
doesn't exist yet, just a `PinInit<Scope>`), but the directory is held
alive. It feels weird, but I suppose users won't usually have a
`PinInit<Scope>` around for long.

The weirdness in debugging would look like:
1. Create dir
2. See dir in filesystem
3. Call `scope`, but don't actually activate the PinInit yet (either
due to coding error or because the target data structure won't be
available until later.
4. See no subdirectories under dir in filesystem
5. Drop `dir`
6. See dir still hanging around

This would also happen with my `pin_init_scope` suggestion, but at
least then user code would be explicitly capturing the `Dir` right in
front of them in the existing-dir case, and in the "create-or-lookup
new dir" case like you've got here, would delay directory creation
until we're actually instantiating the directory somewhere.

> +
> +        Scope::new(data, move |data| {
> +            #[cfg(CONFIG_DEBUG_FS)]
> +            let scoped =3D match parent_entry {
> +                None =3D> ScopedDir::empty(),
> +                Some(entry) =3D> ScopedDir {
> +                    entry: ManuallyDrop::new(Entry::dynamic_dir(name, So=
me(entry))),
> +                    _phantom: PhantomData,
> +                },
> +            };
> +            #[cfg(not(CONFIG_DEBUG_FS))]
> +            let scoped =3D ScopedDir::empty();
> +
>              init(data, &scoped);
>              scoped.into_entry()
>          })
> --
> 2.52.0
>
>


On Wed, Dec 17, 2025 at 5:49=E2=80=AFPM Timur Tabi <ttabi@nvidia.com> wrote=
:
>
> Dir::scope() was declared as taking &'a self, which tied the returned
> PinInit's lifetime to the Dir. This prevented using scope() with a
> locally-created Dir:
>
>     let dir =3D Dir::lookup(...).unwrap_or_else(Dir::empty);
>     let scope =3D dir.scope(...);  // Error: returns value referencing lo=
cal
>
> The borrow was unnecessary since scoped_dir() internally clones the
> Arc<Entry>. Fix this by cloning self.0 before the closure, allowing the
> closure to capture the cloned value via move instead of borrowing self.
>
> This also removes the now-unused scoped_dir() helper method, inlining
> its logic directly into scope().
>
> Signed-off-by: Timur Tabi <ttabi@nvidia.com>
> ---
>  rust/kernel/debugfs.rs | 41 +++++++++++++++++------------------------
>  1 file changed, 17 insertions(+), 24 deletions(-)
>
> diff --git a/rust/kernel/debugfs.rs b/rust/kernel/debugfs.rs
> index b0cfe22982d6..35f9cbb261e7 100644
> --- a/rust/kernel/debugfs.rs
> +++ b/rust/kernel/debugfs.rs
> @@ -397,27 +397,6 @@ pub fn write_callback_file<'a, T, E: 'a, W>(
>          self.create_file(name, data, file_ops)
>      }
>
> -    // While this function is safe, it is intentionally not public becau=
se it's a bit of a
> -    // footgun.
> -    //
> -    // Unless you also extract the `entry` later and schedule it for `Dr=
op` at the appropriate
> -    // time, a `ScopedDir` with a `Dir` parent will never be deleted.
> -    fn scoped_dir<'data>(&self, name: &CStr) -> ScopedDir<'data, 'static=
> {
> -        #[cfg(CONFIG_DEBUG_FS)]
> -        {
> -            let parent_entry =3D match &self.0 {
> -                None =3D> return ScopedDir::empty(),
> -                Some(entry) =3D> entry.clone(),
> -            };
> -            ScopedDir {
> -                entry: ManuallyDrop::new(Entry::dynamic_dir(name, Some(p=
arent_entry))),
> -                _phantom: PhantomData,
> -            }
> -        }
> -        #[cfg(not(CONFIG_DEBUG_FS))]
> -        ScopedDir::empty()
> -    }
> -
>      /// Creates a new scope, which is a directory associated with some d=
ata `T`.
>      ///
>      /// The created directory will be a subdirectory of `self`. The `ini=
t` closure is called to
> @@ -427,7 +406,7 @@ fn scoped_dir<'data>(&self, name: &CStr) -> ScopedDir=
<'data, 'static> {
>      /// The entire directory tree created within the scope will be remov=
ed when the returned
>      /// `Scope` handle is dropped.
>      pub fn scope<'a, T: 'a, E: 'a, F>(
> -        &'a self,
> +        &self,
>          data: impl PinInit<T, E> + 'a,
>          name: &'a CStr,
>          init: F,
> @@ -435,8 +414,22 @@ pub fn scope<'a, T: 'a, E: 'a, F>(
>      where
>          F: for<'data, 'dir> FnOnce(&'data T, &'dir ScopedDir<'data, 'dir=
>) + 'a,
>      {
> -        Scope::new(data, |data| {
> -            let scoped =3D self.scoped_dir(name);
> +        // Clone the parent entry so the closure doesn't need to borrow =
`self`.
> +        #[cfg(CONFIG_DEBUG_FS)]
> +        let parent_entry =3D self.0.clone();
> +
> +        Scope::new(data, move |data| {
> +            #[cfg(CONFIG_DEBUG_FS)]
> +            let scoped =3D match parent_entry {
> +                None =3D> ScopedDir::empty(),
> +                Some(entry) =3D> ScopedDir {
> +                    entry: ManuallyDrop::new(Entry::dynamic_dir(name, So=
me(entry))),
> +                    _phantom: PhantomData,
> +                },
> +            };
> +            #[cfg(not(CONFIG_DEBUG_FS))]
> +            let scoped =3D ScopedDir::empty();
> +
>              init(data, &scoped);
>              scoped.into_entry()
>          })
> --
> 2.52.0
>
>
