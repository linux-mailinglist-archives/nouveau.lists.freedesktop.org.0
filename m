Return-Path: <nouveau-bounces@lists.freedesktop.org>
Delivered-To: lists+nouveau@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SJkoFG7Bb2lsMQAAu9opvQ
	(envelope-from <nouveau-bounces@lists.freedesktop.org>)
	for <lists+nouveau@lfdr.de>; Tue, 20 Jan 2026 18:54:54 +0100
X-Original-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 510DE48EA5
	for <lists+nouveau@lfdr.de>; Tue, 20 Jan 2026 18:54:53 +0100 (CET)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 1F8A010E641;
	Tue, 20 Jan 2026 17:54:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="sH6ouIQg";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 44A3344CBB;
	Tue, 20 Jan 2026 17:46:06 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1768931166;
 b=R+R5BwKXRpdY0AEngUBRM494reX7JLGyNVFLitG2Df8pjSUjiyIVBo4RP/v0KFFsLCnhC
 RnJT3C2Ju4NCMlymigG3ULqc8w3Zpxy5Gm9Aa2XLSRBoLJRwVPjTMaEVnzCnVxckXhctlfM
 tJExs9d4fpf4I0K1xi5gjOr9EbIX4BFTYkfSN2t/dWEFnA2+FBpiySisjoKmmkVh42x0cxt
 s2Czs8lO9x1EEss4NoqNS9xch/9bNi1l/5yEnJ0Kj+NZm3R1Rv0cfK4F/cDPlCZ3nx2r0vL
 7UNEtEkleg4VpV2PsNz5r9XBBKquuwAs8asE8ukdfYgSdwPwOiC26dF1yzsQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1768931166; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=jft6THq09271RMd7h3tPOydoy0a3rVfq9Xg1LUh61UE=;
 b=Gud1aBmYrf6++n29Poi2ow1vLjT1s9yVVcH7GdpZFGGB0ts4BaLSwf+akG53VXkhXqaeN
 S/lm4BgIhDynq1CPSw9gt8shQE0FZRug0VKqsi+8MWy24OzoN8sDDHPrn/ufeSnVCPfz+7p
 RdhyfmsQZANUjsHMkueWKrdu/yqbOlkdXexZNBUkuwNyUF46NTvJ8Rm+nF4ROGdj5lJyfdJ
 PejtC4IyJP4cHGCNbPmr5qzb8rmNZ1cYwQo9nisul0weF9r8DAl0UapQQJRElH/kXIkqMMd
 /WWJIaMxP6g5J/qz81XSMFpE9e8OjDqxaiLumgzCEIzHku/Qwi0Z8Lu3yXEA==
ARC-Authentication-Results: i=2; mail.freedesktop.org;
 dkim=pass header.d=google.com;
  arc=pass;
  dmarc=pass (Used From Domain Record) header.from=google.com
 policy.dmarc=reject
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=google.com;
 arc=pass;
 dmarc=pass (Used From Domain Record) header.from=google.com policy.dmarc=reject
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id CC7E6400D1
	for <nouveau@lists.freedesktop.org>; Tue, 20 Jan 2026 17:46:03 +0000 (UTC)
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com
 [209.85.208.44])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 61C2210E63E
	for <nouveau@lists.freedesktop.org>; Tue, 20 Jan 2026 17:54:48 +0000 (UTC)
Received: by mail-ed1-f44.google.com with SMTP id
 4fb4d7f45d1cf-657fec06242so147a12.1
        for <nouveau@lists.freedesktop.org>;
 Tue, 20 Jan 2026 09:54:48 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1768931687; cv=none;
        d=google.com; s=arc-20240605;
        b=MSuCfI+vHhQbX8irCeRB6ssqi+UQIpoILKGmq+Qew0Te8SSq8w6gKRN5sK4OVsdN8z
         /qx8H7maYzIPGneyPRdqWj942QfwwUFOUHAqwRL9T1oCSU7ADZ7sI82ksoBGkEqF2KOz
         lt49mTJukgAcEtGrRne1TCwGQ3siPzu1PMmcGJPcdNdEMieguKhAslSgu8ozLBTkiSB+
         VP5L77IVC7YeeT4zhj0e4EYyT17Fij9S+wSAGjs4Jine3ykE0mnWjPT363Jn0ydf3UyX
         q/oqg0ypSnGHBxGffGGo+GKi9BDKnoYDpZzLAKKIhU+EA6dXkvRpFh7mt3ha+KalaC5V
         78sw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=jft6THq09271RMd7h3tPOydoy0a3rVfq9Xg1LUh61UE=;
        fh=9SpsUDAxNGe6/uYH5xe2/uXhczSAn1KnKcLVlogru+E=;
        b=bl/SyWeI/fXYyqhklbS76uHazhKUDHdP6ZHVtVqjfQzvTrqNzmcS/CXPlsemLoX6S1
         1FOkJsF2qm+5mwDDT9bcEMMC1iL9fAU31FdemPNK/sO7ws8W5ssumzwCb4LTtxE7iNzZ
         S0bvdfposmfQOydCoHGlir9SESubOwT98LaadO0tCqk4heNL3C+4cJl/b5m4KVrnbPdD
         mc87sHIaW/d/Hl+j9QyjNmTfyKu152baALpydY2MIiAkB3tGbb4aeb/TZzgZ0OyGAOqp
         B0xKVa+ymW/9IEFRqPt44pr24Vw++cMz1qN5nu/OpWUjYLLoVduC/f/Fbk5jBBolnPss
         erfQ==;
        darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1768931687; x=1769536487;
 darn=lists.freedesktop.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jft6THq09271RMd7h3tPOydoy0a3rVfq9Xg1LUh61UE=;
        b=sH6ouIQgnWrh2TE6JnCkDuZJt1jSFStYYu/zCYKyoQxd0tK7yq1OLn+XYNY5cN8mhH
         FGsZcsr0+8ocjMY87kl81jIzEvd4qETH7+K/MCkVBCF+5nhgrkbIYmmNYirOaB/vek46
         hPAL1jQ+bDOTZwJ/CzBxEglJupq9bIPwQ+uY2NIwB02RrWfnzCE5IFdxLA3WYYR2h1fo
         xyOw98uof4jkiBEqjoMCOn4KryF2HRoCvPDUNxb21K0A1ij7YMTbQTMCZDd7Sf1pdr7h
         FXJy19aKzih+9sObCRlcISsTGRZyktTHs7ybFu3WuHPdamfJuAKkLvrnoW+LiHNo3yzt
         fc+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768931687; x=1769536487;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=jft6THq09271RMd7h3tPOydoy0a3rVfq9Xg1LUh61UE=;
        b=oILu9oCyz6P3wnGkA59WY+PzUvrzsNJ+Zg7nuXkTWspjMAv4wxRbwPYSZFwV2Oblvn
         RJU+mZ81G4Ok6K+/gmPOylaBEfJ0afSafeM7Qfc8Xzsed/yb9Hdy+nLxm9/Fbc0SVs7X
         Vm6Kuu3vs74fNzgkAg9MisVJHvNMZ8ZOZrgMAfB/OQkEj60j7V/JYYV6kQ8lE5lQv2A3
         Ltrood6qqBXVyuXDPdkel8OeWiBQK+ZkU7jsDLIYmjN18UzSlc2Wj5h4hGjNpxNWClT2
         cuB/1NEZuALKHrF4adIBRlbwZgbDB5lrXmydnWl3UAZmMmYw9vxsAStYu+AEh386E1VL
         MkFw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUB7xV6JTmWTHflfa01gDCuO/lJIlQSY1qqqbLxLps3P6pURDEwb0UG+7ibYmLJGbBQJl4SWwXT@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxVdcKXEjWX2jAm0B2+qfgmtCqsfiTGmyqD4XZTnsBk3YgM+nK7
	89gRCemlhoGz1nA5Buos6pVBFvCDYvu5TEXGvkvfzL8+rB0qt9016FlpCRdah72ejYp++B9ptkA
	WzEJM8GzDOHN2aAXYVMtKRjB6nxu5kidgCJOL9KAfq5ErMGX3bvp39K1G
X-Gm-Gg: AZuq6aIPyfxJGHVXA54Xho1/Feg3oXeNUwoKGpcx+tMckTkh0g8Na0KU9joGCGf7LL3
	lCSmdVlqHQq0mQfZQo6Esk9X1VGPU/7wr7GkMeitj5wI9YnvEBukFuA41JL6Ih5ecbl+/7tWyyD
	rZ48XH01wVBIRGFWYBUMf3ulBsIV9Obg0DAD9MGVJ+qo9KG1iSOQ6we/PHSbyjGPUgFgVaC/u++
	7dAPtPOvIzTSHlgIBEuS+u8TF9x4CXanX9axez1bWiT3bf2eaqg3Wt4wNws6orfpdhCq+wIUKeX
	8gHPuFrTuas46EAGeBlS47X0IXafSFxV3OY=
X-Received: by 2002:a05:6402:5052:b0:655:ac89:92ce with SMTP id
 4fb4d7f45d1cf-6560b37aaaemr150437a12.16.1768931686728; Tue, 20 Jan 2026
 09:54:46 -0800 (PST)
MIME-Version: 1.0
References: <20260116214959.641032-1-ttabi@nvidia.com>
 <20260116214959.641032-3-ttabi@nvidia.com>
In-Reply-To: <20260116214959.641032-3-ttabi@nvidia.com>
From: Matthew Maurer <mmaurer@google.com>
Date: Tue, 20 Jan 2026 09:54:33 -0800
X-Gm-Features: AZwV_QgFJtJo9ERHdhC6JMlYvhsy0igZvgz8-jFT2Z_91f_ZX-nN4lpTrntG_ns
Message-ID: 
 <CAGSQo02KDAuHiec0vnZEYN45Tr-Kt8nWhUW41rHCQpnCTGpxNg@mail.gmail.com>
Subject: Re: [PATCH v5 2/8] rust: debugfs: add Dir::empty() for conditional
 debugfs usage
To: Timur Tabi <ttabi@nvidia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: YRJYH5NQWY3QJM5YMZN3JRNXG7A4DBTP
X-Message-ID-Hash: YRJYH5NQWY3QJM5YMZN3JRNXG7A4DBTP
X-MailFrom: mmaurer@google.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
CC: Danilo Krummrich <dakr@kernel.org>, Gary Guo <gary@garyguo.net>,
 Joel Fernandes <joelagnelf@nvidia.com>,
 Alexandre Courbot <acourbot@nvidia.com>, nouveau@lists.freedesktop.org,
 rust-for-linux@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/YRJYH5NQWY3QJM5YMZN3JRNXG7A4DBTP/>
Archived-At: 
 <https://lore.freedesktop.org/CAGSQo02KDAuHiec0vnZEYN45Tr-Kt8nWhUW41rHCQpnCTGpxNg@mail.gmail.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>
X-Spamd-Result: default: False [1.39 / 15.00];
	DMARC_POLICY_REJECT(2.00)[google.com : SPF not aligned (relaxed),reject];
	R_DKIM_REJECT(1.00)[google.com:s=20230601];
	ARC_ALLOW(-1.00)[lists.freedesktop.org:s=20240201:i=2];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:ttabi@nvidia.com,m:dakr@kernel.org,m:gary@garyguo.net,m:joelagnelf@nvidia.com,m:acourbot@nvidia.com,m:nouveau@lists.freedesktop.org,m:rust-for-linux@vger.kernel.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[mmaurer@google.com,nouveau-bounces@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[nouveau@lists.freedesktop.org];
	DKIM_TRACE(0.00)[google.com:-];
	MISSING_XM_UA(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mmaurer@google.com,nouveau-bounces@lists.freedesktop.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[nouveau@lists.freedesktop.org];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[nouveau];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,nvidia.com:email,mail.gmail.com:mid]
X-Rspamd-Queue-Id: 510DE48EA5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, Jan 16, 2026 at 1:50=E2=80=AFPM Timur Tabi <ttabi@nvidia.com> wrote=
:
>
> Add Dir::empty() which returns a &'static reference to a no-op Dir.
> All file and subdirectory operations on this directory silently succeed
> without creating actual filesystem entries.

I thought the whole point of Greg's admonition to never report errors
and to automatically create no-op structures if debugfs was disable
was that we *don't* do things like this, and instead you just do
something like

```
// Always do this, whether or not debugfs is available.
let debugfs_root =3D Dir::new("my_thing");
debugfs_root.scope(data, name, |d, s| { ... })
```

If DebugFS is not available, it already returns an empty fake
directory. That variant of a fake directory is also size 0, so you
aren't paying anything to use it...

>
> This enables callers to use a single code path regardless of whether
> debugfs is available at runtime. For example:
>
>     let dir =3D optional_debugfs_root.unwrap_or_else(|| Dir::empty());
>     dir.scope(data, name, |d, s| { ... })
>
> The returned reference has 'static lifetime, allowing initializers
> returned by scope() to be used outside the immediate scope where the
> Dir reference was obtained.
>
> Signed-off-by: Timur Tabi <ttabi@nvidia.com>
> ---
>  rust/kernel/debugfs.rs | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
>
> diff --git a/rust/kernel/debugfs.rs b/rust/kernel/debugfs.rs
> index facad81e8290..44ff2b37786a 100644
> --- a/rust/kernel/debugfs.rs
> +++ b/rust/kernel/debugfs.rs
> @@ -110,6 +110,24 @@ pub fn new(name: &CStr) -> Self {
>          Dir::create(name, None)
>      }
>
> +    /// Returns a reference to a static no-op directory that doesn't cre=
ate any debugfs entries.
> +    ///
> +    /// All file and subdirectory creation operations on this directory =
will silently succeed
> +    /// without creating actual filesystem entries. This is useful when =
you want to conditionally
> +    /// enable debugfs but use the same code path regardless.
> +    pub fn empty() -> &'static Self {
> +        #[cfg(CONFIG_DEBUG_FS)]
> +        {
> +            static EMPTY: Dir =3D Dir(None);
> +            &EMPTY
> +        }
> +        #[cfg(not(CONFIG_DEBUG_FS))]
> +        {
> +            static EMPTY: Dir =3D Dir();
> +            &EMPTY
> +        }
> +    }
> +
>      /// Creates a subdirectory within this directory.
>      ///
>      /// # Examples
> --
> 2.52.0
>
