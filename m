Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F7FACD7085
	for <lists+nouveau@lfdr.de>; Mon, 22 Dec 2025 21:04:28 +0100 (CET)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 99FE510E29C;
	Mon, 22 Dec 2025 20:04:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Ks4sEbD4";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 2B9C144C4E;
	Mon, 22 Dec 2025 19:56:45 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1766433405;
 b=Kk+cbT/tWFPBxjnWvIQVjr0aUXGl1ZQKgCYrgsCZH7Yj5Ccy9lwZw2XZrvIeL+8rwURiO
 LS8M0AHn0s3/HFvvQ0q5sXcQVdzgNWhRigS8Z8eH6sue/llSfhDqpsc/NBnZcj/OJyWiedf
 Pddig39VslErN6vSrKVyZMWxzsq9Nwm2dh7P6scqFtwr9dBv8ujo34AuUu9y0exo2AGbH6V
 6+zYPUOPaV3JfkDz49yKTR87I9WCRVe7EY4W3mam5R13L0wpYKShYst4PzG2Ezr/n/HNJ69
 vZpgslcLUd7ecETnHbG9Lto7EX/6dBrnSnq/eY0Y2UWJtbOLIyuteSlQwC8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1766433405; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=MsNw3QANNzXGCC+wfU8B5+Ncwkor4a1kPh5rqbsQfSI=;
 b=IllDE9Byc81Y+xUZPQ3OBe5KELpAHzJxOchf8XR49ov9seTaLjJkGGtO51BEjNNkZqBS3
 lKfFiNZn+BQ0v2OeBC0R2VsyciEHMwXnIm/JAclRYr7nWagqQ44LbPqGqiUeas9dUy3r0EG
 uYonr0BMUpA6gB9RKUmfGZ/VuCm9KfUPuzXbUUyjnn/eMUVVQQTyVCXvr4uXRhqPkUWnpS/
 aUbmo4pZjyHtyQx1Gq3DZ7ZdkyT6Tb0DwSIbcrgYBei3DVgSw9K0EdQUIRwxm/Lb88dflvD
 TiasVJPsizCTDSo3wuXDlD5HN7PqfU9hmWfhL5SaMAPSHD9j9nuupAzpZlGw==
ARC-Authentication-Results: i=1; mail.freedesktop.org;
 dkim=pass header.d=kernel.org;
  arc=none (Message is not ARC signed);
  dmarc=pass (Used From Domain Record) header.from=kernel.org
 policy.dmarc=quarantine
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=kernel.org;
 arc=none (Message is not ARC signed);
 dmarc=pass (Used From Domain Record) header.from=kernel.org
 policy.dmarc=quarantine
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id EFBC6440AB
	for <nouveau@lists.freedesktop.org>; Mon, 22 Dec 2025 19:56:41 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 11D5010E07C;
	Mon, 22 Dec 2025 20:04:22 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 2B9BE40DB7;
	Mon, 22 Dec 2025 20:04:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5FB36C4CEF1;
	Mon, 22 Dec 2025 20:04:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766433861;
	bh=zwpPZI3aCzU701r+bt49CUPkrH2uvexax+yCoGFo4dk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=Ks4sEbD4BmEIL+iZbfylQlhQIi6pN3LrZ83VQb9hSJU3r7XUizrxcsW6e/FeWfUvd
	 gUHvKlGB9e7kpSWLMwSsxLIajsEJesvz+egvwY9KfQKhXq5lWNSDo7ad5p76ERuwYn
	 nx733ghtCo2Vv0USO877gmZtEIAvFFkMMf4O5yXdUVX8g1KzsKgmEYf13snZfFswn2
	 UzB43OXM0N2SIksoQEeMUYVUD9pc+B9Qd24TzWGVxk7U11h1w87whOpqfCRkCfjgCG
	 trJawH2puCyAErsYIAFuNf7WoKp1zQJIft2VjIy4xRgaq9BOtNkaBPi2FfphiVKZ71
	 5RKGWht8ECTkQ==
From: Mark Brown <broonie@kernel.org>
To: "Rafael J. Wysocki" <rafael@kernel.org>,
 Viresh Kumar <viresh.kumar@linaro.org>, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 Danilo Krummrich <dakr@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 FUJITA Tomonori <fujita.tomonori@gmail.com>, Andrew Lunn <andrew@lunn.ch>,
 Heiner Kallweit <hkallweit1@gmail.com>,
 Russell King <linux@armlinux.org.uk>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Breno Leitao <leitao@debian.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Luis Chamberlain <mcgrof@kernel.org>, Russ Weight <russ.weight@linux.dev>,
 Dave Ertman <david.m.ertman@intel.com>, Ira Weiny <ira.weiny@intel.com>,
 Leon Romanovsky <leon@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
 Arnd Bergmann <arnd@arndb.de>, Brendan Higgins <brendan.higgins@linux.dev>,
 David Gow <davidgow@google.com>, Jens Axboe <axboe@kernel.dk>,
 Alexandre Courbot <acourbot@nvidia.com>,
 Alexander Viro <viro@zeniv.linux.org.uk>,
 Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>,
 Liam Girdwood <lgirdwood@gmail.com>, Rae Moar <raemoar63@gmail.com>,
 Tamir Duberstein <tamird@gmail.com>
In-Reply-To: <20250925-core-cstr-cstrings-v2-0-78e0aaace1cd@gmail.com>
References: <20250925-core-cstr-cstrings-v2-0-78e0aaace1cd@gmail.com>
Subject: Re: (subset) [PATCH v2 00/19] rust: replace `kernel::c_str!` with
 C-Strings
Message-Id: <176643385114.959021.16173066477128119135.b4-ty@kernel.org>
Date: Mon, 22 Dec 2025 20:04:11 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-47773
Message-ID-Hash: PVOAQGQYQIY2JJJ2YV3ZJY54FPJG2QM7
X-Message-ID-Hash: PVOAQGQYQIY2JJJ2YV3ZJY54FPJG2QM7
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
CC: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, netdev@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-pci@vger.kernel.org,
 linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com,
 linux-block@vger.kernel.org, linux-fsdevel@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/PVOAQGQYQIY2JJJ2YV3ZJY54FPJG2QM7/>
Archived-At: 
 <https://lore.freedesktop.org/176643385114.959021.16173066477128119135.b4-ty@kernel.org/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Thu, 25 Sep 2025 09:53:48 -0400, Tamir Duberstein wrote:
> This series depends on step 3[0].
> 
> Subsystem maintainers: I would appreciate your `Acked-by`s so that this
> can be taken through Miguel's tree (where the previous series must go).
> 
> Link: https://lore.kernel.org/all/20250925-cstr-core-v16-0-5cdcb3470ec2@gmail.com/ [0]
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git for-next

Thanks!

[19/19] rust: regulator: replace `kernel::c_str!` with C-Strings
        commit: b0655377aa5a410df02d89170c20141a1a5bbc28

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark

