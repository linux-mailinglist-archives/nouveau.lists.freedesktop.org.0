Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E2373CBACBB
	for <lists+nouveau@lfdr.de>; Sat, 13 Dec 2025 13:44:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 95BE310EB92;
	Sat, 13 Dec 2025 12:41:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=permerror (0-bit key) header.d=gmail.com header.i=@gmail.com header.b="g8u/TRCt";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com
 [209.85.214.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 80B1E10E528
 for <nouveau@lists.freedesktop.org>; Mon, 20 Oct 2025 21:30:56 +0000 (UTC)
Received: by mail-pl1-f170.google.com with SMTP id
 d9443c01a7336-2699ef1b4e3so8403625ad.0
 for <nouveau@lists.freedesktop.org>; Mon, 20 Oct 2025 14:30:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1760995856; x=1761600656; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ba6kY56LKajg5gR+mfYZ1l0Mti/V4+1lpEveR2gotOM=;
 b=g8u/TRCtMuerj/6WPtSZxs0mdLnnUc+WndlPVux+w7IMdEMscCkwRieq3xlcl/wuF0
 8C/DEelgFCGRlOMevcDivICPijiQ6aT2ueo5q/tJwdibGrIE9BlhuV/uDvWaoihHpcE1
 v8BI2cCO730/RXWcFPZsa4VJApGb30vpc+S6r9JzECALrU3bWybywjg2fieZGIybfMmf
 eKxrCRA91CdelLQCvcgXW8d3taQvE+/JS18bClhTXRJxA3Y0ZgBKB6aFZ17k7DsMxuip
 jY9TgVSDEpmB3py78rJoMJTs0Qup9+s5YFmuhTqBfjChoh9QEtOVw7deNOI5ySVsTvb1
 HsSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760995856; x=1761600656;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ba6kY56LKajg5gR+mfYZ1l0Mti/V4+1lpEveR2gotOM=;
 b=ISl1dz9GqwMCPaCuNGicoZamlVfu0R85Ad3viuXprJeOLMjFVoWhYXjMLqwHSyBIFm
 UIddWIZe78MHB6FDE/3oOW4P6PdTUct52Ijc3CagPl3opGV5xeu9pYxFuClw6Cbj61uq
 ks8cyMwMf6mJtCWFnqVNGvSx2FV69qwP4siySdTNBKx8c5b1WBd7GCLRw3m1PWLzV+gl
 CbSRJz7z7ejTyPzT0rZnR8gvPZtTnSNyTEANmqfBuzfx8dZqTF95L7NukXGesVglnGXW
 +6/5Wqnvpcst2Xo75hOpY8P4dx9WO3FBFZ3ok3P0I3HMdk5vMexAFtShDZqa7zX+oo6a
 jgNg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWBy8PIMQ5ZY0KsC0S1eWYAuysRPQuZB9xv0n6PdxLFrkOKbfDOJmiajiCjH2pt7IgUrWkERrwT@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyVJ1x04LvkajVjpzmF2rmW8y9jaGtTEgzUzlhA2VJlnyBVKj4e
 Dx9db7L16gb/WIjbHXS3eS/KK4hqaOpld6wSEw0gQsYE27YVlNHGaNI0WWzkMnv4kM3MeWGQkOE
 tn1GBPdcPAeLph8S7PLewlalggo4cZMW+npSCLMmBcg==
X-Gm-Gg: ASbGnct1eheKS5I6Ws86DjiuskrSLSdeeG9DwQkONL6DTjrJlAxlXvO/XQCQ31eeoxg
 J/PHeqnt4asLmjscfXW51NHLSqxruadK6aiw7J8jq0dOLv0X0NJTD1wP1QVD9skz8QT13p1D28p
 +8A5m97p79KHLVQ4HRus9JItO3KnnpPt20Rdm9M6M+mIpwO6qCkI4UfNtppnthOBcX/p0L2x7lh
 MJfw5TnJ6Rptf+UPO+zM6txeohM3Glgik6+Lfxu8KnVnTAn0SatCtUN4PsBmHp4RBmco+TWVmY+
 2CrxUz05NLigtoYTcCLGcPL/9HGlEbv2jjoRC4FxTS8WFG8sikbsNBdNAnCgxlSnfmHi8VozwEG
 p2TuHnQqpw5Nr3g==
X-Google-Smtp-Source: AGHT+IGuIlogvO3qiXAz17lC+JAXlrcckH7vWCchmd8okkyTNJDWWsiiPF/LNLwVhABlkDWXY45TBR8ANM/9BveSOCo=
X-Received: by 2002:a17:903:8c3:b0:25a:4437:dbb7 with SMTP id
 d9443c01a7336-290c9d2debcmr99091045ad.4.1760995856042; Mon, 20 Oct 2025
 14:30:56 -0700 (PDT)
MIME-Version: 1.0
References: <20251020185539.49986-1-joelagnelf@nvidia.com>
 <20251020185539.49986-8-joelagnelf@nvidia.com>
In-Reply-To: <20251020185539.49986-8-joelagnelf@nvidia.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 20 Oct 2025 23:30:43 +0200
X-Gm-Features: AS18NWBOQUVimKkWa1HJu_1dg-N_FwTUSitxLBjCaOz3GTuCAcSPB_k9_xk69eM
Message-ID: <CANiq72=SSQ5nSjt9yzX_A3Tgo2ByGM5CV0VqFnF1cTOzrZ-pbg@mail.gmail.com>
Subject: Re: [PATCH 7/7] nova-core: mm: Add data structures for page table
 management
To: Joel Fernandes <joelagnelf@nvidia.com>
Cc: linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, dakr@kernel.org, acourbot@nvidia.com, 
 Alistair Popple <apopple@nvidia.com>, Miguel Ojeda <ojeda@kernel.org>, 
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
 Gary Guo <gary@garyguo.net>, bjorn3_gh@protonmail.com, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, John Hubbard <jhubbard@nvidia.com>,
 Timur Tabi <ttabi@nvidia.com>, 
 joel@joelfernandes.org, Elle Rhumsaa <elle@weathered-steel.dev>, 
 Daniel Almeida <daniel.almeida@collabora.com>, nouveau@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Sat, 13 Dec 2025 12:40:48 +0000
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

Hi Joel,

A few nits below (I do sometimes this kind of docs review to try to
keep a consistent style across all Rust code).

On Mon, Oct 20, 2025 at 8:56=E2=80=AFPM Joel Fernandes <joelagnelf@nvidia.c=
om> wrote:
>
> +//!     .set_table_frame_number(new_table.frame_number());
> +//! // Call a function to write PDE to VRAM address

Newline between these. Period ad the end.

> +//! ## Given a PTE, Get or allocate a PFN (page frame number).

In headers, no period at the end. Also, is "Get" intended to be capitalized=
?

> +//!     // Call a function to read 64-bit PTE value from VRAM address

Period at the end too (more of these elsewhere).

> +//!     if pte.valid() {
> +//!         // Return physical frame number from existing mapping
> +//!         Ok(Pfn::new(pte.frame_number()))

Early returns where possible, like in C, i.e. to avoid indentation on
big `else` branches.

> +/// Memory size constants
> +pub(crate) const KB: usize =3D 1024;
> +pub(crate) const MB: usize =3D KB * 1024;

The docs will only apply to the first item, so this probably was meant
to be a `//` instead of a `///`.

Or you could use a module to contain these (and then possibly `use`
them outside), and then you can have docs in the module itself, but
that is heavier.

> +/// Page size: 4 KiB
> +pub(crate) const PAGE_SIZE: usize =3D 4 * KB;

`rustdoc` would eventually render the value and the non-evaluated
expression, and in the source code it already says `4 * KB`, so I
think repeating the value isn't needed, unless you mean to show it is
really a multiple of 2.

> +pub(crate) enum PageTableLevel {
> +    Pdb, // Level 0 - Page Directory Base
> +    L1,  // Level 1
> +    L2,  // Level 2
> +    L3,  // Level 3 - Dual PDE (128-bit entries)
> +    L4,  // Level 4 - PTEs

In this case, I think you meant the other way around, i.e. actual
docs: `///` instead of `//`.

(Also, unless there is a particular reason (e.g. it is a big table),
please generally put comments on top of things, not at the side, which
matches closer to what is needed for docs.)

> +    /// Convert an Address to a frame number.

These should eventually be intra-doc links, but at least please use
for the moment backticks when referring to Rust items like types etc.

> +    /// # Example

We always use the plural for these section headers, even if there is a
single item (e.g. single example).

> +    /// ```no_run
> +    /// let va =3D VirtualAddress::default();
> +    /// let pte_idx =3D va.level_index(PageTableLevel::L4);
> +    /// ```

This will need some `use` lines -- not needed now, but just as a
reminder that these will get actually built eventually.

> +    /// Get raw u64 value.

Intra-doc link or at least backticks.

> +    /// The valid bit is inverted so add an accessor to flip it.
> +    pub(crate) fn set_valid(&self, value: bool) -> Pde {

This docs string sounds like a commit message.

> +/// Dual PDE at Level 3 - 128-bit entry containing both LPT and SPT poin=
ters.
> +/// Lower 64 bits =3D big/large page, upper 64 bits =3D small page.

It sounds like a few of these details should be on its own paragraph
to avoid having them in the short description (title).

> +/// // Call a function to read dual PDE from VRAM address
> +/// let mut dual_pde: DualPde =3D read_dual_pde(dpde_addr)?;
> +/// // Call a function to allocate a page table and return its VRAM addr=
ess
> +/// let spt_addr =3D allocate_page_table()?;
> +/// dual_pde.set_spt(Pfn::from(spt_addr), AperturePde::VideoMemory);
> +/// // Call a function to write dual PDE to VRAM address
> +/// write_dual_pde(dpde_addr, dual_pde)?;

Newlines before the comments, i.e. between "conceptual blocks".

> +    pub lpt: Pde, // Large/Big Page Table pointer (2MB pages) - bits 63:=
0 (lower)
> +    pub spt: Pde, // Small Page Table pointer (4KB pages) - bits 127:64 =
(upper)

Docs instead of comments.

> +    /// Check if has valid Small Page Table.

Missing word?

Thanks!

Cheers,
Miguel
