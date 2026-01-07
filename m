Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 216A9CFF159
	for <lists+nouveau@lfdr.de>; Wed, 07 Jan 2026 18:24:37 +0100 (CET)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 894A810E60D;
	Wed,  7 Jan 2026 17:24:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="E+rllcvr";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id AD22444CA3;
	Wed,  7 Jan 2026 17:16:19 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1767806179;
 b=vEwGpZm7Dc15JBWH+yiIzcXiKQdmZfll1oDsZ+LqWdSwgRIM2ktn+Qttwz2E2xiwykKST
 qZw7iTQYiGzKxy0jKPoga1VD/yd3cxE/LZXamfbJteftR022izEeyUtpx84lWkqf3+kduZa
 DgmrXWzWW++X2maQHpTP3gJdR6WGACJ9beP51W2wyP0F3dCS497Tc4eUS2yDyxnvSWn24cg
 UiQbgOUTLFPuNDD3LoJM4UfqECPU4rK8GtgFx/dR5lh1Wfv+BdGMA/R9g5NhdXbJ5wBMQ4x
 jWCQbDlUkK1+daC2XY6Oi+RRIyi9QXq6U41+tTy2vYdrhRss/wdjsj0ATm8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1767806179; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=XqdCPkDx31P+/88ZI9oqnb0Z6s4jrFfvs9pYpKRo6yA=;
 b=bK5Lghk1Vewq65WWt3hfLgocBUnoMUmCR5maMUuqiYKaKhYUqr1t1f/lYgaT+lqXYOqbJ
 /MbUSOlNkoBrZREDxcp4rWYOktlesYfSTDnZ8FC5nco3CPkyKRPaMyPnhA9QQZciCFjW29v
 tSqaK8FGNt58kNU5Kj91uz1apHXMjGoZ8jopkwBZ8eXzSJofHb0Eb5IibfQ+Ji4t3cYymOG
 CE+1Q3/I3eI7DWHMmvJobO0IbgWL3PCaw1ad01Jx1rKF8V8/D6pZM3N5hqxMoW0ro4V3+wL
 nfNETAHWjzn9cF1ydn6cel7k+nmSXyVZu44bpCqykhgUuuRyOGrkPjB53pjQ==
ARC-Authentication-Results: i=1; mail.freedesktop.org;
 dkim=pass header.d=gmail.com;
  arc=none (Message is not ARC signed);
  dmarc=pass (Used From Domain Record) header.from=gmail.com
 policy.dmarc=quarantine
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=gmail.com;
 arc=none (Message is not ARC signed);
 dmarc=pass (Used From Domain Record) header.from=gmail.com
 policy.dmarc=quarantine
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 16F7244C9E
	for <nouveau@lists.freedesktop.org>; Wed,  7 Jan 2026 17:16:17 +0000 (UTC)
Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com
 [74.125.82.175])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 98C6210E2B6
	for <nouveau@lists.freedesktop.org>; Wed,  7 Jan 2026 17:24:32 +0000 (UTC)
Received: by mail-dy1-f175.google.com with SMTP id
 5a478bee46e88-2b07583340dso125907eec.3
        for <nouveau@lists.freedesktop.org>;
 Wed, 07 Jan 2026 09:24:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767806672; x=1768411472;
 darn=lists.freedesktop.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XqdCPkDx31P+/88ZI9oqnb0Z6s4jrFfvs9pYpKRo6yA=;
        b=E+rllcvrrS/IxN7TNbufXAxcLqOijWTVha4qTumO70VevlpavtB0XP3grQjH8tmLGR
         MKAV+n/T3E7aY6YPCm/pJTQWV/ReGxFsSz24Dkv4q5P6uxoqOwzBhNY+aSrcCdnhWY16
         e/eDGSRPzlZDPruzz7uGhmJnu7HP7XRbHS7Lnn8GvOyygomVebfZp4KnmBco7zq+AubF
         FcdDWQI/0BnYNNEYN37Y3NbZr50++fdzA7WnZBww/qSsYytL4e1mVDrCKOraq0wRXSsS
         On5ymqjuqebTKellCmrPSJG652vSV1L6H+RNqXfzpUrHAjqTXbMzciFSGe+OzMPadh9v
         rCYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767806672; x=1768411472;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=XqdCPkDx31P+/88ZI9oqnb0Z6s4jrFfvs9pYpKRo6yA=;
        b=hh/joCjgL7p3D/cfH9VeuXfI0du97QWRg09oTTCnLu+Nzm9q6Jdrawy+QOJBUA5w1h
         VixaYAZhnnqBJ1ArJ3GhjISdddIpH2etHPqV8JnJaR1+hWzLtVDLL9VY1cOGQpwUpCO2
         l7VzVqT4jRM/LBVHnFxzd7OzMieEPviB24i3xPIMVCDPUn3eDMVOUQqBomw/FSIMN5MQ
         gnD/4lij06+vbnoqxPMfJq017I3A41uA5r/tgTTis6oE5bnRClEKa2RjUNRDpRRWv58O
         jf+nydLOf09xOMPlSbfNEN/RpNhCpdDBoxkXpRvT/xkv1HEEsKXzsMXhh3EefvWqQR5Z
         zXnA==
X-Forwarded-Encrypted: i=1;
 AJvYcCV/1SAIDaWla1XPPpYu2SCANCa1tFm8bNfSw/ZnuqUsNpSPpvHKEzSLxstY0De2MxeQvzxZ74iB@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywex77F1dc1bR2qRFvpOEpyXTfy7zy4CMiWuaZINlSTIkNz3XQp
	+JBCZKDM0M1hVEEChpyKIcVqybbRpaAOBdpVkes7cv6AGQchkto12pEAANFlV1Tnx76Ryt90c2/
	QKYYMrjO0ZtG/0YIrUqeaZuAtmyOjc9g=
X-Gm-Gg: AY/fxX5oFItHH28G1dkYmJ7q6DVE8HRnr5rFc2RgDvY9FvXhcgUc6sKInnhyrKj3X35
	7ebEkZNQktHULlTxT+kU1dlc45cK9EMA8pC/EkdKfH8Pg4DKfCRGhYuTjMhXdCM60nAv96nnT1L
	W0xSgWbPshC2Bod9Wt/nT3hcSPA4Lpgzev3Z2xvMpcQX5uxVPlZc0jI289oUHW0V3CS+hDZ6W+6
	rhFgs8DRbUpLauK2BSHBY5ITTycefJblAsSxGJUUZwOHAOzdM9PrqFliHTVPJVLxTmg2HLSODjx
	+JXkyBQ1lztposadIsXT4R+7Namp9/0uRRitFpSUeXG9Le0+aS+89e5IIBWE2g/ks85hgqzN9Kj
	NwVfqaJ+OMibt
X-Google-Smtp-Source: 
 AGHT+IEmNxe4H46v90z5Qsg81/iqvWHE2i419t6wujoy5EZQVIHlyBEXzgh5s/UfED7pXNr75mh1zoYiP0dchnOTKuI=
X-Received: by 2002:a05:7300:e58b:b0:2ae:5bd5:c241 with SMTP id
 5a478bee46e88-2b17d33c615mr1278675eec.7.1767806671760; Wed, 07 Jan 2026
 09:24:31 -0800 (PST)
MIME-Version: 1.0
References: <c5c5c0a4-249f-41b0-b5f1-87a58514b120@nvidia.com>
 <8822A0A5-CD4C-403A-A001-F4E7A351D81B@joelfernandes.org>
 <CANiq72mUCGL3f=GAYSZfMV1=NXpOjz4vsV7B3Pd-=EG8tmWC_A@mail.gmail.com>
 <39e74621-aba6-47eb-9935-0d2321c56d6d@nvidia.com>
In-Reply-To: <39e74621-aba6-47eb-9935-0d2321c56d6d@nvidia.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 7 Jan 2026 18:24:17 +0100
X-Gm-Features: AQt7F2rzlYOZPcNPb5Y3stczaGAhwYq9zU0rJFqAE7X1RLdvvhtO7z7v_rYamrg
Message-ID: 
 <CANiq72=vcYkfZtgDfSZaHY=0PMOwc+XiiJo74pciPOV7nrN6Nw@mail.gmail.com>
Subject: Re: [PATCH] MAINTAINERS: Update email address for Joel Fernandes
To: Joel Fernandes <joelagnelf@nvidia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: LTKITDWDPZRLDI7CWP6AF2O3EMNJEFJT
X-Message-ID-Hash: LTKITDWDPZRLDI7CWP6AF2O3EMNJEFJT
X-MailFrom: miguel.ojeda.sandonis@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
CC: Joel Fernandes <joel@joelfernandes.org>, linux-kernel@vger.kernel.org,
 rcu@vger.kernel.org, rust-for-linux <rust-for-linux@vger.kernel.org>,
 nouveau@lists.freedesktop.org, Boqun Feng <boqun.feng@gmail.com>,
 Paul E McKenney <paulmck@kernel.org>, Jason Gunthorpe <jgg@nvidia.com>,
 Steven Rostedt <rostedt@goodmis.org>, rostedt@google.com,
 Yury Norov <yury.norov@gmail.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/LTKITDWDPZRLDI7CWP6AF2O3EMNJEFJT/>
Archived-At: 
 <https://lore.freedesktop.org/CANiq72=vcYkfZtgDfSZaHY=0PMOwc+XiiJo74pciPOV7nrN6Nw@mail.gmail.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Wed, Jan 7, 2026 at 6:20=E2=80=AFPM Joel Fernandes <joelagnelf@nvidia.co=
m> wrote:
>
> Thank you for the suggestion! Unfortunately, that would hide the company
> attribution too. Or require it to be in brackets along with the name. The=
re

Yeah, I meant it only as a solution for the email trouble -- the
attribution in parenthesis would of course still be needed if you /
your company want that.

> appears to be resistance to both these. I do feel fortunate to get compan=
y time
> to work upstream, so, on this matter, I have to go with the company's
> preferences.;-).

I suspected that given the thread... :) But happy to sign your key if
you need it in the future, and happy new year too!

Cheers,
Miguel
