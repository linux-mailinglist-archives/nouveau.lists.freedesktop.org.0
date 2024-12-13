Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 09E4FCBAD1C
	for <lists+nouveau@lfdr.de>; Sat, 13 Dec 2025 13:44:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 120E110EA59;
	Sat, 13 Dec 2025 12:41:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=permerror (0-bit key) header.d=suse.com header.i=@suse.com header.b="Qrny3f+i";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [IPv6:2a00:1450:4864:20::62d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C547D10EF33
 for <nouveau@lists.freedesktop.org>; Fri, 13 Dec 2024 08:05:51 +0000 (UTC)
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-aa6b4cc7270so183374366b.0
 for <nouveau@lists.freedesktop.org>; Fri, 13 Dec 2024 00:05:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=suse.com; s=google; t=1734077150; x=1734681950; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=lgwYE8AkKohlShjZLrwteb4c+nimfkWQZUupQYO5W68=;
 b=Qrny3f+iKFiqDyOb/8dDJ/AFdJ7F8OYMFNw2GC6HVEqTIJM3VTdLX9bGKMBKLoltdF
 hBMonnBwplrMomw1zNZkEKAFP82A+y96HZqfeI4J2ma5ihdgGyAgemaFAWCzqEYfnMJl
 20pO4s+01y4c5jKLudAK1nMmdAf/sbk3fOJTz0cFDVhySSp+ivGX2NJNHMpXTBqUjHuK
 R3GlnQtW/6YLAvvZ2uqq9ZM5U2K0JujaFDgKdF8PKzpiiOi6ma6kJhjgDwUGnSLSIY+S
 XkrEk07Aiug2a76S9/uK/kj5JJFU1ZWFxw2Zjen+9PFLJkUvR4HgHCYs3kUZRzyX707K
 Q7yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734077150; x=1734681950;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=lgwYE8AkKohlShjZLrwteb4c+nimfkWQZUupQYO5W68=;
 b=wc6R/gfeYVHF2v4VRG/cHfrNJCrmwHKZSjZ3Y+oYmokkdip5douyQvmPxwfjIB0IGT
 GrZzGZiEHvvzGYdZQCFKSm0xiufWFONFvB4jzeZJ/bRXJn9y/AcYdjdj/eboE5Qn3YGP
 yKRaKCJtbiKeCauFiVCf5FPuf0G70jpXKlQ/N0U9ZK3w4Vu/ktf20lfRE4Azo4z5BwKf
 /qmLxcSvGUztdfziJm7zMZlb47To4sJJMUa+6G0B+mL+Ty2TYZ7jB/C1MM1akkOmo6Sk
 5HeHumM1YkfwLNdvPOIORyoQXZzS7r/eGqbBs5rROrFSV+h7LiF6TDxchUWbntla8TRh
 WYFw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWhFPVglm8beGHeDnKBvq/bg2GavsSUqTMCgYXfy9qK5nbDkVjrgophb8q543eejsXz1poXbOIk@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzWlAHPGO9k6V6BMvIbnA4P2dDvPoPih9+BOi3SZDD9BdaMwu78
 /L32zw9hwgeZNmTtGtEvGC9zJc2fOubC3HX08RxREOS2PgPQrnUa53irT8wA7U4=
X-Gm-Gg: ASbGncvUXfSCzRRhGaFLZq74AFqpumbb0YJ6tNKBRwu9BhiUP1fxmuMEkxp6Q493D3m
 tIMqz3k9aOR5u9zGUbz00ZbE6qKoriFUgHs+5ReRg6aDBtwYetSIolLYV/pQq2IPnwTg7xuCPnf
 SiC+KlmjLWGJ69qhsNf9SBuun/jyQJntb40CG81nc3G5F1hdv99Y9xOl9e6J3Hr94VlizHd0gsK
 OpDCit6hyvH4/+BklNiuvZqJjma7ALLpCbpWYsiyR74HOqChG1IyeUKlQ==
X-Google-Smtp-Source: AGHT+IEBU3KaEVduDDJFmDiYKp43p4o//mXEFM4u7vCzKG7h47JoeDZ5E1DdrcH3VOsdWE+nfKrYuQ==
X-Received: by 2002:a05:6402:4584:b0:5d0:ea4f:972f with SMTP id
 4fb4d7f45d1cf-5d63c318beemr3590523a12.8.1734077150211; 
 Fri, 13 Dec 2024 00:05:50 -0800 (PST)
Received: from pathway.suse.cz ([176.114.240.50])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5d3ef026a41sm7507030a12.15.2024.12.13.00.05.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Dec 2024 00:05:49 -0800 (PST)
Date: Fri, 13 Dec 2024 09:05:47 +0100
From: Petr Mladek <pmladek@suse.com>
To: Yafang Shao <laoar.shao@gmail.com>
Cc: torvalds@linux-foundation.org, akpm@linux-foundation.org,
 linux-kernel@vger.kernel.org, linux-security-module@vger.kernel.org,
 x86@kernel.org, linux-snps-arc@lists.infradead.org,
 linux-wireless@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, ocfs2-devel@lists.linux.dev,
 Steven Rostedt <rostedt@goodmis.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 Sergey Senozhatsky <senozhatsky@chromium.org>,
 Andy Whitcroft <apw@canonical.com>, Joe Perches <joe@perches.com>,
 Dwaipayan Ray <dwaipayanray1@gmail.com>,
 Lukas Bulwahn <lukas.bulwahn@gmail.com>
Subject: Re: [PATCH 1/7] vsprintf: Add %pTN to print task name
Message-ID: <Z1vq2-V7vB5KhBR9@pathway.suse.cz>
References: <20241213054610.55843-1-laoar.shao@gmail.com>
 <20241213054610.55843-2-laoar.shao@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241213054610.55843-2-laoar.shao@gmail.com>
X-Mailman-Approved-At: Sat, 13 Dec 2025 12:40:47 +0000
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

On Fri 2024-12-13 13:46:04, Yafang Shao wrote:
> Since the task->comm is guaranteed to be NUL-ternimated, we can print it
> directly. Add a new vsnprintf format specifier "%pTN" to print task comm,
> where 'p' represents the task Pointer, 'T' stands for Task, and 'N' denots
> Name. With this abstraction, the user no longer needs to care about
> retrieving task name.

What is the advantage, please?

Honestly, I believe that the meaning of

	printk("%s\n", task->comm);

is much more clear than using a cryptic %pXYZ modifier:

	printk("%pTN\n", task);


The %pXYZ modifiers makes sense only when the formatting of the printed
information needs some processing. But this is a plain string.
IMHO, it is not worth it. In fact, I believe that it is a
counter productive.

Best Regards,
Petr
