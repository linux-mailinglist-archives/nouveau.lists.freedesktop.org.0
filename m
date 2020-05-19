Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AB2F1D8C46
	for <lists+nouveau@lfdr.de>; Tue, 19 May 2020 02:29:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C3CD56E4CD;
	Tue, 19 May 2020 00:29:35 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com
 [IPv6:2a00:1450:4864:20::141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7815E6E4CD
 for <nouveau@lists.freedesktop.org>; Tue, 19 May 2020 00:29:34 +0000 (UTC)
Received: by mail-lf1-x141.google.com with SMTP id x27so9565594lfg.9
 for <nouveau@lists.freedesktop.org>; Mon, 18 May 2020 17:29:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Lp5YS4wnqdBmdbNdBQYAqe4C1skHr56PklzUDuGNt/o=;
 b=HhfO0c/8Afa39iKCJTB/VymbLZle1h5CJm8AufmRSEUwBn1RFOp146dtIZ9YMMYJwD
 RIsrpTUNyS/4zSVsfHF+DajZ2AXyTU0XqO0JvcLfWy5PnMEXZeMdzN+/JsfVpklg/2It
 hYaSG+aYP1iUn/RWWyuBF1JUePeDCVxxVxWUw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Lp5YS4wnqdBmdbNdBQYAqe4C1skHr56PklzUDuGNt/o=;
 b=ilrX9cFIFpw50CL3Xubb34Ce2dTfVN1qH2yXcpwHMeoHAYs0sLO6/3l83UHFqpQEXa
 qXc5rG1fMwWsmjhfYNoM8cQDydUksEwxXPN/AeJ5OZAEVBuFzLUfBbwHal6kop6guAOV
 6zII85kUnx7lvw2QEZkYBPdrvQKr/Bzh3XbC3oLStvJLeHf1g2BBBRxAQoTdqFT4kc11
 y8f40K0affGjgtU4eDxWvVoaIBHoAzKovI8vU4gdMkEs/6oDrSZy6/8uRHl4tTg07qt0
 +4Kn/x0uHmB9Q0G4Ays1S9KjRXfg4wN8xIX0freo7cHWqJiNAANleqp2Nb94sTM1zrFE
 O6fg==
X-Gm-Message-State: AOAM533fteKTrDvqEhEXdwGnkDbNaIYrge0S6PHQr9Gc0Xh2FimG3ujh
 zqedYHaIUVl+hMYX6XN80rK2+h2mBuI=
X-Google-Smtp-Source: ABdhPJza8dUvRbWHcGqy8iMV9a7TMwulEZgJqAv/Mwf5sg+7bgKH4AaQNEF/7KZpb136zM8K8LYV7g==
X-Received: by 2002:ac2:558e:: with SMTP id v14mr13303295lfg.138.1589848171604; 
 Mon, 18 May 2020 17:29:31 -0700 (PDT)
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com.
 [209.85.208.170])
 by smtp.gmail.com with ESMTPSA id u8sm8049043lff.38.2020.05.18.17.29.30
 for <nouveau@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 18 May 2020 17:29:30 -0700 (PDT)
Received: by mail-lj1-f170.google.com with SMTP id m18so3424187ljo.5
 for <nouveau@lists.freedesktop.org>; Mon, 18 May 2020 17:29:30 -0700 (PDT)
X-Received: by 2002:a2e:8956:: with SMTP id b22mr5686169ljk.16.1589848169813; 
 Mon, 18 May 2020 17:29:29 -0700 (PDT)
MIME-Version: 1.0
References: <20200408205323.44490-1-natechancellor@gmail.com>
 <20200518093117.GA719849@ubuntu-s3-xlarge-x86>
 <CAKwvOdmXgYThHRDpt5dFZy5T1zS6MYQhcBNcq6-rsuc5fjiE6Q@mail.gmail.com>
 <20200518183513.53b94f11@gandalf.local.home>
In-Reply-To: <20200518183513.53b94f11@gandalf.local.home>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Mon, 18 May 2020 17:29:13 -0700
X-Gmail-Original-Message-ID: <CAHk-=wiwom6EF4DqStcZD0cJwXRMwAmLx2Z-wcn5xTiaJpgEkA@mail.gmail.com>
Message-ID: <CAHk-=wiwom6EF4DqStcZD0cJwXRMwAmLx2Z-wcn5xTiaJpgEkA@mail.gmail.com>
To: Steven Rostedt <rostedt@goodmis.org>
Subject: Re: [Nouveau] [PATCH] x86: mmiotrace: Use cpumask_available for
 cpumask_var_t variables
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
Cc: nouveau@lists.freedesktop.org,
 "maintainer:X86 ARCHITECTURE \(32-BIT AND 64-BIT\)" <x86@kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>,
 LKML <linux-kernel@vger.kernel.org>,
 clang-built-linux <clang-built-linux@googlegroups.com>,
 Pekka Paalanen <ppaalanen@gmail.com>, Sedat Dilek <sedat.dilek@gmail.com>,
 Nathan Chancellor <natechancellor@gmail.com>, Ingo Molnar <mingo@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On Mon, May 18, 2020 at 3:35 PM Steven Rostedt <rostedt@goodmis.org> wrote:
>
> Linus,
>
> Are you OK with this patch?

Yup, I don't care deeply either way, as long as we can get rid of the warning.

                Linus
_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
