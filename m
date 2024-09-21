Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 49EF697DB7F
	for <lists+nouveau@lfdr.de>; Sat, 21 Sep 2024 04:42:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A77610E308;
	Sat, 21 Sep 2024 02:42:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="EMj6IU0O";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com
 [209.85.216.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C73610E308
 for <nouveau@lists.freedesktop.org>; Sat, 21 Sep 2024 02:42:44 +0000 (UTC)
Received: by mail-pj1-f45.google.com with SMTP id
 98e67ed59e1d1-2d86f713557so1865277a91.2
 for <nouveau@lists.freedesktop.org>; Fri, 20 Sep 2024 19:42:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1726886564; x=1727491364; darn=lists.freedesktop.org;
 h=content-transfer-encoding:subject:from:content-language:to
 :user-agent:mime-version:date:message-id:from:to:cc:subject:date
 :message-id:reply-to;
 bh=h3iRr46MdhCKy1ndVWwBufftrcbcQExvonxq+jYKqew=;
 b=EMj6IU0OTCjer6zAVQA/M/Xqk3nO1BKmYCgbj2iJZ6ZHjYVMJuRupcofxF9auPuupM
 MLdne03lNrHXvCnR8AGn4DgLKbSiN6fiW0rx1PgupDNZ1HE6D1Xn7zy/L7TOzDzyJ0Il
 1anFXOpHcrTN3oFL8eMGXe2JJYnhTBIIuNjZAUvUopzCXa2UEDwqBqcjVP4iqz1dyPAh
 urKzuxDBA20HZxzuU4C05YLquVpRnAbuEyK+HU9pm7LprM9ntxNY4W1e/m8PlUcy58Ps
 lhDuQk29XDfZA68xmPJrSDkw8H99tpzLKc0ItfY+p40aRId/cmUFXxg/FE5J1RRToOyR
 KQ/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726886564; x=1727491364;
 h=content-transfer-encoding:subject:from:content-language:to
 :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=h3iRr46MdhCKy1ndVWwBufftrcbcQExvonxq+jYKqew=;
 b=Gs1pxZhzJXaTXcKba4u6HOCIAUU/k4YHEocpgfKiXcoBkw/9OjOXkOs+px55AmdQAG
 7JfIZrpUAwiwM3HFZVUHS8lM00pjsPy4epKRDS8F1v3TK5+slI55fo6wb8Rdq9FVNgzB
 3dzaqK4OZkMrvT/7n62P1cr14eu4zL0h5ZuOrhfutNEyek0NtNtxKG36Mu05xIVfs/Iv
 ICXQJCxo+5ghjtEswQGp+Ufbg6czjG4cwmGu97MZBWtja5xI2+wEtazmS7+s2VsptBRE
 SwzHnqqnfkZDY3LnmTctdH6hztmlvKNuNAwKVtDV8G9gATjEEOdxqJKsdS+J3PZ0OClN
 exqQ==
X-Gm-Message-State: AOJu0YyQMPZFup29dSeBkXHdLDA3OX685yHvoHB9l3DF1K2A4k/PNeTB
 uSaD2F47Q+QoTWsv2OwphKbdjvX/Xjy6ooIBWt3MSdvgatSA0yM0eypU/nDi
X-Google-Smtp-Source: AGHT+IH5hmZCKO3HxQQ7feHYx/AvwKTT2lefVxc4dn7DYNplnkzMbSjJgyhIC30vHjWmp2jDDDhpRw==
X-Received: by 2002:a17:90a:e2d7:b0:2d8:898c:3e9b with SMTP id
 98e67ed59e1d1-2dd80c960f3mr5414984a91.25.1726886563545; 
 Fri, 20 Sep 2024 19:42:43 -0700 (PDT)
Received: from ?IPV6:2406:2d40:4124:a510::539? ([2406:2d40:4124:a510::539])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2dd7f8ca487sm2740687a91.39.2024.09.20.19.42.42
 for <nouveau@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 20 Sep 2024 19:42:43 -0700 (PDT)
Message-ID: <db268a78-5e39-4256-975d-ab5959448617@gmail.com>
Date: Sat, 21 Sep 2024 12:42:40 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: nouveau@lists.freedesktop.org
Content-Language: en-US
From: Jack Harrington <jackharro282@gmail.com>
Subject: Options for xorg.conf supported by driver
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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

G'day,

I'm configuring my xorg.conf to set my dGPU as the main GPU because my 
laptop's fans aren't supported and the GPU fan is really important for 
the thermals. The CPU fan sucks air from the base, and the dGPU fan 
pushes it out the back.

It's an Inspiron 15 7000 which isn't support by i8x as far as I could tell.

So I'm wondering, is there a list of options that nouveau can understand 
from xorg.conf, in particular something to control switcherooctl like 
how nvidia has PrimaryGPU?

I want to try out light gaming with nouveau on the 1050Ti before I mess 
with nvidia again.

Cheers,

Jack Harrington

