Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 792B4B49BC1
	for <lists+nouveau@lfdr.de>; Mon,  8 Sep 2025 23:21:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DFD7A10E5DA;
	Mon,  8 Sep 2025 21:21:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=darkrefraction-com.20230601.gappssmtp.com header.i=@darkrefraction-com.20230601.gappssmtp.com header.b="TtV3oWv6";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com
 [209.85.218.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F1DF10E5DA
 for <nouveau@lists.freedesktop.org>; Mon,  8 Sep 2025 21:21:30 +0000 (UTC)
Received: by mail-ej1-f50.google.com with SMTP id
 a640c23a62f3a-b043da5a55fso658591866b.0
 for <nouveau@lists.freedesktop.org>; Mon, 08 Sep 2025 14:21:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=darkrefraction-com.20230601.gappssmtp.com; s=20230601; t=1757366489;
 x=1757971289; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=eoNTJMKU9iOlrWl+MFmGasFoGj85suUe9BA2fsfDCVM=;
 b=TtV3oWv6apgYABcSgHFNu+6y258U7nSgA7hBuXculYW4UwvIy2e2ioLVRzRV2POF4p
 OTbNqX8bpMuPH7B+ssizmPz4sXITFVR5sQIe2nfWNddPDjuOb1BR/Pa/JqulBaSp8QHp
 cwGNjSS+raclxyGoQGwe+3KmqaTSy72hpa5Ib8+WNhBpN8f6MOT6gtWtdzZQ/mfr/TnY
 t2YlZrBBJfNeuRAzPAiQVuT/Ux8CD/4SK3f5avbAHaHA93czO61UIFjXXW6uu5QkqyOQ
 nKwh69YHgMCZPB7mVDJWoXTHCEanDVKq3fpwWSND621kDyO/+Eu+G331C3NEFJir/qPi
 a47A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757366489; x=1757971289;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=eoNTJMKU9iOlrWl+MFmGasFoGj85suUe9BA2fsfDCVM=;
 b=eYSI2QmqU383Ac6Zlr1Mvg2ps3xdly6s6PxWKulCJBLf6LGUrBEssfEQgatTkG6QA9
 Nc24vvvxgfm86dy8NLs57rnbH2jj8sfhg4Yr7oPkFNuVFy0PxSN1U8MUK/bap2DceEP2
 BvU5EhGwyDGNyIa/fTO7TEIqFe2sYcmxTCA5ju05gTFRHx88anBCCJcfiAnluxDn4+57
 HbHAJMsv1ioaoXKzTKzBsoJDiE0mtK6SngTFDZwx+FfUz8qVB96O98JYqqV/KTd6Sqeg
 Yh6ae+gn5mukx/MyvPUpp1shIX+6ciM0tftvqMz0XbyHEuWgmcxnxS8961wDFaKa3npy
 pqMg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVhNhWvf/o5regOkS7WpsKieU6YWl3gtSHCzy0/yDYoI5GmzxFPTqCyVlVedM3n7A7fBb4vIwcB@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzjShdb8w9vEqtyhnPf/zpgU8ArYMcfhKwZGNpZGBF9emB/BoMW
 RPSWN8PKdyKme538FEhHBxsaMVj64S+XmigSM5UW6OBOgrd3kSjA/dFoIdrErE+cVMBlJWPbT+j
 lYtxegb3LxKXfqBfaH50nSUWK3MlU7GnqZeqiKWD64Q==
X-Gm-Gg: ASbGnctX3Z7BwKOB7LQswahZPaavREYzg40Ug2H09LLyR6b6DD9ROZqZqpun22sV/MW
 jnaLU45ftBW71/7k44wpwi6tMhBC7IJ80G2RJm1VXqvVszNxS1ccoglSIuooXJWNzj+u3GnPve9
 j+dSfcPL6mTZiiyFQvdJE8Ldt/sUVeKbcHCToOTiO5skahyLO1/ywEPA9BMt8tFmhXR97kfV0VT
 zARsp3CZ4fxSXwZqDM=
X-Google-Smtp-Source: AGHT+IH9SgiC3aVido2/N3XUr78h4QxbX+QTjJxuowVtNq1Ulr0lG4061PcI4Mlbk8tHASgcwtQ9iWL8bMNPlHCJx/U=
X-Received: by 2002:a17:907:d8b:b0:afe:7909:f42a with SMTP id
 a640c23a62f3a-b04b1714531mr871159366b.51.1757366488564; Mon, 08 Sep 2025
 14:21:28 -0700 (PDT)
MIME-Version: 1.0
References: <20250829021633.1674524-1-airlied@gmail.com>
 <CAAgWFh0QgCe3MMExMkJqdRBj5NqDrJ7zq6eaQ-Yszm2xFaqRpQ@mail.gmail.com>
 <CAPM=9twR-NFDnZUPy4WO8dte5wii+Wq+GTJxZaLDJRifYsMYDg@mail.gmail.com>
In-Reply-To: <CAPM=9twR-NFDnZUPy4WO8dte5wii+Wq+GTJxZaLDJRifYsMYDg@mail.gmail.com>
From: M Henning <mhenning@darkrefraction.com>
Date: Mon, 8 Sep 2025 17:21:02 -0400
X-Gm-Features: Ac12FXx7t9gI0ziNtm8oa1gkQg-8QJMhnpIna0JQI1IJ_9poC6WMReylPpnE6zE
Message-ID: <CAAgWFh1aT37aTDUzXQhRbzV1Ha8Jz3PeKu4_PhsakFDBg4drkg@mail.gmail.com>
Subject: Re: [PATCH 1/2] nouveau: fix disabling the nonstall irq due to storm
 code. (v2)
To: Dave Airlie <airlied@gmail.com>
Cc: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org, 
 dakr@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Mon, Sep 1, 2025 at 4:52=E2=80=AFPM Dave Airlie <airlied@gmail.com> wrot=
e:
>
> On Tue, 2 Sept 2025 at 04:18, M Henning <mhenning@darkrefraction.com> wro=
te:
> > Maybe we should also do this for older GPUs? eg. perhaps we should
> > also update gf100_fifo_nonstall_allow / gf100_fifo_nonstall_block ?
>
> Those actually turn off the irq at the hardware, and therefore
> shouldn't hit the allowed path check, not touching that without
> someone showing it's broken.
>
> Dave.

I did some testing on kepler and it looks like it is broken. I can
reproduce the Talos + transfer queue issue there easily. I wrote
https://gitlab.freedesktop.org/mhenning/linux/-/commit/b3ef72898ae2bf19cf58=
7b8679d193c9570ddb05
to fix the membar half of the issue but that still doesn't load Talos
with a transfer queue, which means that we either need to apply this
fix (nouveau: fix disabling the nonstall irq due to storm code) for
kepler and probably all the other gens, or there's yet another bug
lurking somewhere.
