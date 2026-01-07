Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 09670CFD032
	for <lists+nouveau@lfdr.de>; Wed, 07 Jan 2026 10:55:03 +0100 (CET)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 626D810E588;
	Wed,  7 Jan 2026 09:55:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="WwLnD3nq";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 3A9A644CA5;
	Wed,  7 Jan 2026 09:46:46 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1767779206;
 b=JBBRYHmSQJboEyJcoBMHxDbFTZtuLeE83nZu3d+dfM6TOQdtUZQD8Zhgo5FQBzFpkaQPy
 OXzPDUxrNI0z50B1+IzNd6zEK/a8zwO6oAK3OJqhk76JmxLCe+SiTA5y/ezKZpNzioUkXUr
 GoJiTwOe0T5gLwo5xNKQhQ0H64wJ5SL0EvfEiG9ZMn2OyzMAxdsXTcAZMbs9NyQzWleMGWo
 ZHDTKddgKxmu1GIZYiYj+YNZrF3rv6DEb/LvaD3szyKEhQrkZGNJ8hYsAv22Y9sqSx4IDkK
 2LmtlTsOtyYqLVKwPpnlgmBOxnBNSkrmgzvep2lQ+T3lgKWqDZa37Yw5AYiQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1767779206; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=DNklWQLKHqeVwnmD3yegr1azyeDrefunLPFH+C/SJKs=;
 b=Hr4tIdNcydW4FhJGM958mfRs1aYmdDTnccit6iLSBbiHGbkMVj3UtGn2KrIxhi/no0ik+
 QUIQR8XbJFtuxWC5H+AdoB6/MH3rKyBny0YFp0Zi3AKNV0wJvWpWvFWZ7iWnYzkbvviBjMt
 AjhHlNSIYnhy/4niK5wJKwG/x/MUe+AhyzPO2uyjpn6P5JHlP5/ssMtjcO/ZWYskMzICy/0
 WFAfE5dseaTKnfK138qo8II94QtYA+/Wy093IVtGNcyxsr4YpFKyYkUaHvMXDtSU+njRw3R
 c2j2fk+uXQeXO17R+LOcBPxI4wRFGQKkXKNWWJwbmQPRa1ORjhiF6aEQIV0A==
ARC-Authentication-Results: i=2; mail.freedesktop.org;
 dkim=pass header.d=gmail.com;
  arc=pass;
  dmarc=pass (Used From Domain Record) header.from=gmail.com
 policy.dmarc=quarantine
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=gmail.com;
 arc=pass;
 dmarc=pass (Used From Domain Record) header.from=gmail.com policy.dmarc=quarantine
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 5BE3D44C9C
	for <nouveau@lists.freedesktop.org>; Wed,  7 Jan 2026 09:46:43 +0000 (UTC)
Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com
 [74.125.82.172])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 30C5810E0DE
	for <nouveau@lists.freedesktop.org>; Wed,  7 Jan 2026 09:54:58 +0000 (UTC)
Received: by mail-dy1-f172.google.com with SMTP id
 5a478bee46e88-2ac37f8898eso23911eec.0
        for <nouveau@lists.freedesktop.org>;
 Wed, 07 Jan 2026 01:54:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1767779697; cv=none;
        d=google.com; s=arc-20240605;
        b=Bf4gxq2rVznfVCpNqsDjxeYh8Ss+xG9a1INWl98iSuYlhXYZw9HXDvm6v7s3yuIhK2
         RMLurw4YaxcsOYs40nKINQmjUSjSng/4sKSylpx2xnx5X6+luYM+bzASZ5Md9b0stefy
         mB3DY4twgzbcKaz87RO56sH9kJfY0etPlV+pTBQWQigxtZqP6a8eEHDt49Axw0RuKrNn
         RKAqttcBJF9Du2KlJXFGPrSh0w9mJQWYJy6t19ETSlS8CJntSCvvA7Q8QuxOzEhjqTpf
         WPFju8y2sDegzqCN3/nzpDKrHs7PnovxX2P4edo3YPYLcrZExQrtO/FCDlu5e/PcIW3E
         HruA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=DNklWQLKHqeVwnmD3yegr1azyeDrefunLPFH+C/SJKs=;
        fh=rpRso5YyqnurPz3uiKKBd+uTQCpOCYtQRP0Fe+9u2Gk=;
        b=Et+LU8QILEKpI1n4EuEx56tUR6LRVW8vs46DyDsN3KcZiKfwzKnBrwep46nMUcGYbh
         nT6TtC92+nulHCzr0QFNJOh5W3jimLlg/DxtK+bWBCLNhqwuNwduYof/qunLSmBVJ+yv
         jOtxs1uSrEK/FaAwT15nm1CsfMuBhTeu5zFHhRXyj1kNe6Y12IFZ2vPgg2W3EVLYeK8o
         KHVh70W6rF4VJnl6/qlRI59YNm3tg1PQEEo/hGEtKbB6IMQF8ic84aUl4yjqVztYMSQK
         W1MPB5f6hJp8IHbdm/P/ujE55m+FvRbRiSqiRr/0R/Vp/FeMi5LlxF5/kTCXeYGT/Fly
         Nokw==;
        darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767779697; x=1768384497;
 darn=lists.freedesktop.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DNklWQLKHqeVwnmD3yegr1azyeDrefunLPFH+C/SJKs=;
        b=WwLnD3nqNkDoY+Pt5eI+vmqGQ7LWdP3U3MK2w4o3npVRsVEiFzvV1admlLLtwExMEr
         E34h/CnQGevbMnSFadQNFjZVYNW9Tqe9IJ2QBUNjqwNzFHbv3CJuhHILyFGyV2uSxE1U
         zRwUy6KxXWu9vnvGUVSENXmHTujHK7lHIEr5fpJn7StZO2+PQyOuj7oFIc3g1eY06O0/
         Er4zW2HS9HkHe91wZP2h6A7NosI026lPTsoJ6fwaLLO/ad97z4WHJp2zRcOr82ssgwX9
         t1w3KxKeKSnaRUAhC+wooK/pKYZL+8zbKa+sQCXMr5XaVkN4thpqR4n33DTF42IFjAaa
         OU7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767779697; x=1768384497;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=DNklWQLKHqeVwnmD3yegr1azyeDrefunLPFH+C/SJKs=;
        b=UFttD4HAHPxpPGeHm+GbEsRyekLMNWKj7myAbc6W22ieGfPY8X+wlIT+5Xd6BzR9sF
         KPSmmgn6/bUuf3aLTRKU8T1SFtMkZES6S5qbjyHZa6TbBJEGusVBOaeXmhy8dT1quqUT
         j+pV3Cunizd0Cj1mzdfyXVUYsKOirjBzmOJ2byLTcrxhfpSLIzj/6nZe7Mfq+l57YTzB
         hWqcLbRGs9usftFTvfGesY88HertegaSV+SAkXFKafxDluS7/1JexmOYHY7HQ27sJx0K
         H0faw/ImxIRYrJ85HNUPNmje+j0xZpwwtyPJ5o+2mrqzUTzOfyFuW4bzH3X5AW2BXVM9
         0CLw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUIxQUrcBnBMsVqsbpDhF2Aukt3QBsSuGmIASrqrMdxajFBaGwgHMh+/IAJCkDsezVxBGef8lhj@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwGYP1DylAnHokSo0WL5xfls5EgEx0sNqVhVqh9hCKM6jtPGHqg
	78+rNQ7RdlNt/FpwsSEaIjORPoZNOa0xVBKkQHst7YM8gioAs2S1rfkZQok2B1MXbLarGjpPopo
	umEa0yJgVHTaSS27iv5ItMlYlRKAU2HE=
X-Gm-Gg: AY/fxX595ZMZhffBMmIuqWWPjhHQ67Uq432IR2i0sTWogR18jIAWArCKU6VlZ0HRlIp
	i1AtMbBZinoHL9TjWTOj5KXhnEKdNCFuFKQfRIkw5Q4/dX4nrFOvyQq5x4l7JX3pGrrNUG78yGm
	Ag8JeuxQHI4Ul0C19kPa8mqIiyC/1I/CE6FqZvYyKV+cQlMMQmk6krHQckt3gh90q4cZCKC2rG1
	bYVXFVI7X3GKzQ5BGJy9BH0B2DKBfWNTcfW+ezIQMYbkFpzlxpA1edraTWYaAvG9lAjHTqtctmC
	mtQjIUfwZpbPd7pYAL1n5SDZp2yUrlCqblkQTSqOupaqQfFHMrw3ZBGyEIDbMyBarKN+Kdzl6JB
	A+nkv7+X98H8U
X-Google-Smtp-Source: 
 AGHT+IF5N2JUpZMAL1fgRNYkRMlX0ZF+78/QhURcqpaoR7nEkqwoFeTWb6LmCpUwN1z4htFRw5HER275U6Q8qn90kVk=
X-Received: by 2002:a05:7300:e9c5:20b0:2a4:3593:5fc6 with SMTP id
 5a478bee46e88-2b17d06e857mr554439eec.0.1767779696945; Wed, 07 Jan 2026
 01:54:56 -0800 (PST)
MIME-Version: 1.0
References: <20260107012414.2429246-1-ttabi@nvidia.com>
 <20260107012414.2429246-2-ttabi@nvidia.com>
 <1d8c517b-1e25-406f-876e-dac4e8b8ae78@nvidia.com>
In-Reply-To: <1d8c517b-1e25-406f-876e-dac4e8b8ae78@nvidia.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 7 Jan 2026 10:54:42 +0100
X-Gm-Features: AQt7F2oZa3tSv9MfFx5UzX1viyKPlo0JCaXiO7s089pgCaG2N6Ounr_tUezFe2Q
Message-ID: 
 <CANiq72mKUxGh8cdZW0fXPCg20zoL19HY0GxRSDSYCj68Mp04vw@mail.gmail.com>
Subject: Re: [PATCH 2/2] gpu: nova-core: add missing newlines to several print
 strings
To: John Hubbard <jhubbard@nvidia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: ZKUZSYHIC5NVJ7ELYV54GAB6DYKDAKQZ
X-Message-ID-Hash: ZKUZSYHIC5NVJ7ELYV54GAB6DYKDAKQZ
X-MailFrom: miguel.ojeda.sandonis@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
CC: Danilo Krummrich <dakr@kernel.org>,
 Alexandre Courbot <acourbot@nvidia.com>,
 Joel Fernandes <joelagnelf@nvidia.com>, nouveau@lists.freedesktop.org,
 rust-for-linux@vger.kernel.org, Miguel Ojeda <ojeda@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Gary Guo <gary@garyguo.net>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/ZKUZSYHIC5NVJ7ELYV54GAB6DYKDAKQZ/>
Archived-At: 
 <https://lore.freedesktop.org/CANiq72mKUxGh8cdZW0fXPCg20zoL19HY0GxRSDSYCj68Mp04vw@mail.gmail.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Wed, Jan 7, 2026 at 3:10=E2=80=AFAM John Hubbard <jhubbard@nvidia.com> w=
rote:
>
> So there is not yet a clear convention visible in the code.
>
> Miguel, Alice, Gary et al, is there actually a preference already?

They are supposed to have the `\n`.

For a bit of context: when we discussed the printing a long time ago,
I originally had:

    info!("foo");

instead of:

    pr_info!("foo\n");

i.e. both the prefix and the newline were assumed, but we were asked
to keep it close to the C side, which is fair.

Cheers,
Miguel
