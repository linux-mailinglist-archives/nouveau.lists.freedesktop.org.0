Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E9029F3FB7
	for <lists+nouveau@lfdr.de>; Tue, 17 Dec 2024 02:08:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4456F10E816;
	Tue, 17 Dec 2024 01:08:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="Ng/LOFFn";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [IPv6:2a00:1450:4864:20::635])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4357210E81B
 for <nouveau@lists.freedesktop.org>; Tue, 17 Dec 2024 01:08:33 +0000 (UTC)
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-aa6c0dbce1fso658400566b.2
 for <nouveau@lists.freedesktop.org>; Mon, 16 Dec 2024 17:08:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google; t=1734397711; x=1735002511;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=x5HbsH3y11AUtX77RP9ShUJxU46vkQ8YNLD+VoIrduA=;
 b=Ng/LOFFnpfNeS7KVGqme+5pWyFl9oejhEHSt0KUJLe29w3wWNqSP76CfU9k6+6vQPL
 pu1vtH2GLoX+2qTS0mujV/SzhXffygVC5cAbaU15o99tD7Gwt9sbo8dq4bLagNKnrEME
 H2TgBFZfONRnaAWZ6T1ts8idJCdxSfRACc4B8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734397711; x=1735002511;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=x5HbsH3y11AUtX77RP9ShUJxU46vkQ8YNLD+VoIrduA=;
 b=RYf0Q52slUNJoj3qBsqegXGAud4qNP1eHBiQsPG+XVRSfjV8H26tfncXQZV6l10shs
 pHyxtCYqil+8iH+YalYdaUDGGVdAnYYq+eYqphs0MeoFco5XxEzwOYQrxNsKAMWathx3
 ztkKTSIyyQWUjKe48QcaUucLSr+vUfXjle0fsDx9ix1BkY8u/howf0C8ZSFeLP5VOFmV
 ncvkTG0sHMQN+DJQQH0pl6GLNK41/1qP7t6MSzovsrNg6EIf00+lbExncKDKexSsTkn1
 qm0rXJ3+gyC8mg5qkZy2CewQN3yzISIb8qiBuZPqUZTxgwDtiMCZyEpzzUdzKib+XOmB
 Mvvw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUatrN+GO5lZwmMxt+ineGSpfOt+roKUfRgr8QApLGrh8nWfJuLlMInbnvR2mqMVTEMrBVJfjCV@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy+XqUCBNjFFVMItRlokAMNzLdCuzhmzCF8FuGbE65O7LRj75u4
 mpnNoVNX3+fP229MEmkFZ1+BtBihqNnWP1EMxbNtsBdaR14K9RuAASkaLxd0UL0PP0jAbRmJkX5
 oxX4=
X-Gm-Gg: ASbGnct2Gez3s3casxDRBS8nwXztcu4IAE6jQw2Z1Mp8OYhJIiJTOQyXwNdWaQxie12
 K4ympn+wexVqPQ8OYf1LCa7tZ0tS/ADiJ6YnK7BVM/p0HTB7nR/UvZO+15Dfzfee600AlcwF4GT
 aQXPVqYOM18REw0PpaWhjXB3YdnOYuuaGZBY7Sy2oUIdtpJR03oBXoDjpfzmTqQifugCE7GUwpQ
 DZYot5TvIO/h/EJ7ZNTmBszONMSpTuUV1WhrmzdZqCGUAzwlVubqcXx3H2srWgF/hQm0Y0bjKKz
 iNF1lYtsSDW87xcnBk00YK7RPklJEOM=
X-Google-Smtp-Source: AGHT+IEmRHDQUs+nidtJPaCAcXCfSSHbIKQN0Dd3FFIseBbhlc6/GXHfm/jtzy0wXBWmqTx6nMEySg==
X-Received: by 2002:a05:6402:5415:b0:5d0:bf5e:eb8 with SMTP id
 4fb4d7f45d1cf-5d63c3dbc28mr32867082a12.23.1734397711612; 
 Mon, 16 Dec 2024 17:08:31 -0800 (PST)
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com.
 [209.85.208.54]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aab960062afsm390069466b.26.2024.12.16.17.08.30
 for <nouveau@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 16 Dec 2024 17:08:30 -0800 (PST)
Received: by mail-ed1-f54.google.com with SMTP id
 4fb4d7f45d1cf-5d0d32cd31aso5812786a12.0
 for <nouveau@lists.freedesktop.org>; Mon, 16 Dec 2024 17:08:30 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCURBsIpOhgUKyY27PKRP1MvbC4iUAouj3QJkDKoZGSkb77IpySRJFYZyw2oWZz9G/UEDqlncvSE@lists.freedesktop.org
X-Received: by 2002:a05:6402:27d4:b0:5d0:d91d:c197 with SMTP id
 4fb4d7f45d1cf-5d63c3db906mr36599487a12.27.1734397709817; Mon, 16 Dec 2024
 17:08:29 -0800 (PST)
MIME-Version: 1.0
References: <20241213054610.55843-1-laoar.shao@gmail.com>
 <20241213054610.55843-6-laoar.shao@gmail.com>
In-Reply-To: <20241213054610.55843-6-laoar.shao@gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Mon, 16 Dec 2024 17:08:13 -0800
X-Gmail-Original-Message-ID: <CAHk-=wj=W-4Eu=g83QPUDB+thtL=uY=_1OAVRvXJP=zay+K4Qg@mail.gmail.com>
Message-ID: <CAHk-=wj=W-4Eu=g83QPUDB+thtL=uY=_1OAVRvXJP=zay+K4Qg@mail.gmail.com>
Subject: Re: [PATCH 5/7] security: Replace get_task_comm() with %pTN
To: Yafang Shao <laoar.shao@gmail.com>
Cc: akpm@linux-foundation.org, linux-kernel@vger.kernel.org, 
 linux-security-module@vger.kernel.org, x86@kernel.org, 
 linux-snps-arc@lists.infradead.org, linux-wireless@vger.kernel.org, 
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org, 
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 ocfs2-devel@lists.linux.dev, Kees Cook <kees@kernel.org>, 
 Paul Moore <paul@paul-moore.com>, James Morris <jmorris@namei.org>, 
 "Serge E. Hallyn" <serge@hallyn.com>
Content-Type: text/plain; charset="UTF-8"
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

On Thu, 12 Dec 2024 at 21:47, Yafang Shao <laoar.shao@gmail.com> wrote:
>
> Since task->comm is guaranteed to be NUL-terminated, we can print it
> directly without the need to copy it into a separate buffer.

So i think we should do the "without copying into a separate buffer"
part of this series, but I do think we should just accept "%s" and
"task->comm".

IOW - getting rid of get_task_comm() is good.

But the "%pTN" pointer format ends up being unnecessary.

          Linus
