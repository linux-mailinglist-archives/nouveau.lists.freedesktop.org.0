Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E8FBD38F04
	for <lists+nouveau@lfdr.de>; Sat, 17 Jan 2026 15:23:28 +0100 (CET)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id A5C0310E24D;
	Sat, 17 Jan 2026 14:23:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="yr6nAUmA";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id CBFF044CA8;
	Sat, 17 Jan 2026 14:14:48 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1768659288;
 b=iiW8XV6RMQJBIZ83rpySxQZH9dyv5wVlztRxA/7PZYnYCxhAjP4r8ublhuS7tTLdrwDoc
 jPdNbo5b252ohobhXwJbIweLfoljE+KOHH6vuaYgRvqTJ8LcHnN0OGrMcBIw0zKFrtze3z3
 Mu75K8SzD9GaIjkl6nfvtH+P75Rh8E++ATe6FY92NRvzV7aP3vulF5GtA/5IWt3jSNSlYNH
 rwCAW/xMKE219cPMAwKfrFZz2H6fGsaU/drxYVLc1c6TCDuic9z/lw4cAofRfB+w3Ejpz5N
 DiMjK59hEYUQPy7xGuFiy/DlXtIltLAJGtUGsB//9rRh6ra3aZ9YG+uJF87Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1768659288; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=GtP5uzdWcGvvJD9r4XrRDlpVG1GSu8NNIFG2QNPypag=;
 b=h70kbY9HmBcuRV+rOgdEnVO/I6K7evxlarTMMC6BawYtfU66IWgb30Qh+ezv0yEQTisl+
 MRuLTXylnKazChi0nRrSZXgr+u9ZakAiuPpFruKRw3ijWk/e4TsrMUCwlTwZ5NaA/VqAVVP
 +E3OaV6NCaNGeO/aNsTaqR4l23uHiaUnwQEdWnFTfXQgP7fHjbbhdsRdOeSxYN6Oh2PmK6b
 aiA0giNq+2epes1PelIMVHJeN6i5GwijRSDjn91j1E2iGo/P5n6lGOk2KMU8jQAPkJg5gqI
 RojEy5JdK5xjmny8xoFC6brG0XmDZpfk/4g8BzoMRKqVp+v0OHzNi17gFaDw==
ARC-Authentication-Results: i=1; mail.freedesktop.org;
 dkim=pass header.d=google.com;
  arc=none (Message is not ARC signed);
  dmarc=pass (Used From Domain Record) header.from=google.com
 policy.dmarc=reject
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=google.com;
 arc=none (Message is not ARC signed);
 dmarc=pass (Used From Domain Record) header.from=google.com
 policy.dmarc=reject
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 694DE44B97
	for <nouveau@lists.freedesktop.org>; Sat, 17 Jan 2026 14:14:45 +0000 (UTC)
Received: from mail-ed1-f74.google.com (mail-ed1-f74.google.com
 [209.85.208.74])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 0CFB810E0CB
	for <nouveau@lists.freedesktop.org>; Sat, 17 Jan 2026 14:23:23 +0000 (UTC)
Received: by mail-ed1-f74.google.com with SMTP id
 4fb4d7f45d1cf-64d3c4deb88so4972743a12.1
        for <nouveau@lists.freedesktop.org>;
 Sat, 17 Jan 2026 06:23:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1768659801; x=1769264601;
 darn=lists.freedesktop.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=GtP5uzdWcGvvJD9r4XrRDlpVG1GSu8NNIFG2QNPypag=;
        b=yr6nAUmAlnX2MPeP6Hjb41+SYxr67Cskskek5rw4QmHDhb+Vd9ybm76lv+6iwYzdTd
         iBo4o2bz52u1n1jHu8xOrfkEWWSg4bQogOKO7+Z7FKCox0h8baSHpq/DTQpaD8kS9FdN
         waamhWnrajl8CyO+X+qO+F8P/BTkAl+TbcztXEes/DA0BsiP2+HCBiWzCMcDn9evnS/5
         awWGsUchzBkJIVlREjJUHFqlhO2mYYVQItZMyJGCLL2mLEhOJ3wIiWEoEtEXBc+N8X7w
         qBKroys275G6dzdQHJ9M95J7sLD4w7zFwWThR6qG1rGJLA39vG6rSNrk6lQqmCab8jAX
         C/Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768659801; x=1769264601;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GtP5uzdWcGvvJD9r4XrRDlpVG1GSu8NNIFG2QNPypag=;
        b=l1dMIqqOOm8ynMr3JZkwX70/5ZkJz++R9UXB89+Jr6K9Ch+2Uw7IaF9V49o8PLmLTw
         EngtqZr+u+d4T0afTM15Md17/GrH+AYj9kGNJkuEyKWcukNRQMxs0deFa1qj+ffezxf2
         yjXq84RXEWHesQxe2OPBApahpSG0PxoKQJoGKFhhxj56XVHBkrl5U46ie26cy4Z1Xts6
         69tzaaGPHloeVs6El39bgztQpMpLT3+q1dkmDJwyWCRIRmWzXtKPXkA6cmUCA+mlLV2i
         g3hPWKiBlU3NzRN0G1TE4L5BkxaquE6iXJxNJdcRXqTXdxtiXlFIUvhmyEpeVWcaI0nT
         WNog==
X-Forwarded-Encrypted: i=1;
 AJvYcCVikAy8FPfJdW/5xvOFiBf1Nmjw+CuP2tq2FkcHAAHNXvAPRP3emPqOpMGEVwZtogpRJHINgHmm@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyfhXLSVOMBS09em/fAD3/GcKme7apzl+JeKLC9PY3chCjeH8N0
	JdVRMkcYft735ntAxQNTSO4FYEMpRLWXRXa0apC5STk2o+H+FztOW10MFoEXykadB0UNpPd7H7S
	5ItcPdiG6zCluY/ezBw==
X-Received: from ejbot8.prod.google.com ([2002:a17:906:ccc8:b0:b87:1dc5:b346])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:907:786:b0:b87:12bc:24e7 with SMTP id
 a640c23a62f3a-b8793256e99mr598790466b.62.1768659801506;
 Sat, 17 Jan 2026 06:23:21 -0800 (PST)
Date: Sat, 17 Jan 2026 14:23:20 +0000
In-Reply-To: <aWuNbUywGRH1zo-0@google.com>
Mime-Version: 1.0
References: <20260116214959.641032-1-ttabi@nvidia.com>
 <20260116214959.641032-4-ttabi@nvidia.com>
 <aWuNbUywGRH1zo-0@google.com>
Message-ID: <aWubWE4kstGI42P9@google.com>
Subject: Re: [PATCH v5 3/8] rust: uaccess: add UserSliceWriter::write_buffer()
 for raw pointer writes
From: Alice Ryhl <aliceryhl@google.com>
To: Timur Tabi <ttabi@nvidia.com>
Content-Type: text/plain; charset="utf-8"
Message-ID-Hash: DD7IGFO2ITBGPVENYOQUII6CLSPPOPHA
X-Message-ID-Hash: DD7IGFO2ITBGPVENYOQUII6CLSPPOPHA
X-MailFrom: 
 3WZtraQkKB5Au52wyBI1508805y.w8678EFyuE52CDC.zByyxyC4D89.8B0@flex--aliceryhl.bounces.google.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
CC: Matthew Maurer <mmaurer@google.com>, Danilo Krummrich <dakr@kernel.org>,
 Gary Guo <gary@garyguo.net>, Joel Fernandes <joelagnelf@nvidia.com>,
 Alexandre Courbot <acourbot@nvidia.com>, nouveau@lists.freedesktop.org,
 rust-for-linux@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/DD7IGFO2ITBGPVENYOQUII6CLSPPOPHA/>
Archived-At: <https://lore.freedesktop.org/aWubWE4kstGI42P9@google.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Sat, Jan 17, 2026 at 01:23:57PM +0000, Alice Ryhl wrote:
> On Fri, Jan 16, 2026 at 03:49:54PM -0600, Timur Tabi wrote:
> > Add a new method to UserSliceWriter that copies data from a raw kernel
> > pointer to userspace, without requiring a Rust slice reference.
> > 
> > The method takes:
> >   - data: raw pointer to the source buffer
> >   - len: total size of the source buffer (for bounds checking)
> >   - offset: byte offset into the source buffer to start copying from
> >   - count: number of bytes to copy
> > 
> > The method is marked unsafe because the caller must ensure the pointer
> > is valid for the specified length and that the memory is not mutated
> > during the call.
> > 
> > Signed-off-by: Timur Tabi <ttabi@nvidia.com>
> > ---
> >  rust/kernel/uaccess.rs | 50 ++++++++++++++++++++++++++++++++++++++++++
> >  1 file changed, 50 insertions(+)
> > 
> > diff --git a/rust/kernel/uaccess.rs b/rust/kernel/uaccess.rs
> > index f989539a31b4..8bbb0084abb1 100644
> > --- a/rust/kernel/uaccess.rs
> > +++ b/rust/kernel/uaccess.rs
> > @@ -481,6 +481,56 @@ pub fn write_slice(&mut self, data: &[u8]) -> Result {
> >          Ok(())
> >      }
> >  
> > +    /// Writes raw data to this user pointer from a raw kernel pointer.
> > +    ///
> > +    /// This is similar to [`Self::write_slice`] but takes a raw pointer instead of a slice,
> > +    /// along with a total buffer length, an offset into the that buffer, and a count of bytes
> > +    /// to copy.
> > +    ///
> > +    /// Returns error if the offset+count exceeds the buffer size.
> > +    ///
> > +    /// Fails with [`EFAULT`] if the write happens on a bad address, or if the write goes out of
> > +    /// bounds of this [`UserSliceWriter`]. This call may modify the associated userspace slice
> > +    /// even if it returns an error.
> > +    ///
> > +    /// # Safety
> > +    ///
> > +    /// - `data` must point to a valid memory region of at least `len` bytes that remains allocated
> > +    ///   for the duration of this call.
> > +    ///
> > +    /// Note: Unlike [`Self::write_slice`], this method does not require exclusive access to the
> > +    /// source memory. The memory may be concurrently modified by other threads or hardware (e.g.,
> > +    /// DMA buffers). In such cases, the copied data may be inconsistent, but this does not cause
> > +    /// undefined behavior.
> > +    pub unsafe fn write_buffer(
> > +        &mut self,
> > +        data: *const u8,
> > +        len: usize,
> > +        offset: usize,
> > +        count: usize,
> > +    ) -> Result {
> 
> Why not this signature?
> 
> 	unsafe fn write_raw_slice(&mut self, data: *const [u8]) -> Result;
> 
> You can implement `write_slice` in terms of it.

To clarify, I think this would be a simpler signature for
`write_buffer()`. And `write_raw_slice()` can be used both for DMA and
to simplify the existing `write_slice`.

Alice
